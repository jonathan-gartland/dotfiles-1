#!/usr/bin/env python

import re
import sys
import os.path
from sqlobject import *
from sqlobject.sqlbuilder import *
import hashlib
from texttable import Texttable
from optparse import OptionParser
from os import environ
from time import *
from datetime import datetime, date
import calendar
from contextlib import contextmanager
import json

project_taskid_mapping = dict()


def parseArgs(option, opt, value, parser):
    assert value is None
    done = 0
    value = []
    rargs = parser.rargs

    while rargs:
        arg = rargs[0]

        if ((arg[:2] == "--" and len(arg) > 2) or
            (arg[:1] == "-" and len(arg) > 1 and arg[1] != "-")):
            break
        else:
            value.append(arg)
            del rargs[0]

    now = datetime.now()

    if len(value) == 0:
        if option.dest == "month":
            value = { 'year': now.year, 'month': now.month }
        elif option.dest == "year":
            value = { 'year': now.year }
        elif option.dest == "fiscal_year":
            value = { 'fiscal_year': now.year }
        elif len( value ) == 1:
            if option.dest == "month":
                value = { 'year': now.year, 'month': value[0] }
            elif option.dest == "year":
                value = { 'year': value[0] }
            elif option.dest == "fiscal_year":
                value = { 'fiscal_year': value[0] }
    elif len( value ) == 2:
        if option.dest == "month":
            value = { 'year': value[1], 'month': value[0] }

    setattr(parser.values, option.dest, value)

    #print "option %s\t\tvalue %s\n" % ( option.dest, str( value ) )


class OptionHandling( object ):

    def __init__( self, argv ):
        self.argv = argv

    def getWeek( self, today ):

        year = today.year
        month = today.month

        cal = calendar.Calendar(calendar.SUNDAY).yeardatescalendar(year, month);

        for y in range( len( cal ) ):
            currentMonth = cal[y]
            for m in range( len( currentMonth ) ):
                week = currentMonth[m]
                for w in range( len( week ) ):
                    days = week[w]
                    for d in range( len( days ) ):
                        day = days[d]
                        if day == today:
                            return week[w]


    def getOptions(self):
        parser = OptionParser()
        parser.add_option("-w", "--week",        dest="week",        help="Task for this Week",  action="store_true" )
        parser.add_option("-m", "--month",      dest="month",       help="Task for this Month [Month Year]", action="callback", callback=parseArgs )
        parser.add_option("-y", "--year",       dest="year",        help="Task for Year [ Year ]", action="callback", callback=parseArgs )
        parser.add_option("-f", "--fiscal_year",    dest="fiscal_year", help="Task for Year [ Fiscal Year ]", action="callback", callback=parseArgs )
        parser.add_option("-s", "--start_date",         dest="start_date",  help="Task for Start Date [ MM/DD/YYYY ]", action="store" )
        parser.add_option("-e", "--end_date",       dest="end_date",  help="Task for End Date [ MM/DD/YYYY ]", action="store" )
        parser.add_option("-o", "--output_format",       dest="output_format",  help="output results in OUTPUT_FORMAT [Task | Report]", action="store" )


        (options, args) = parser.parse_args( args = self.argv )

        if len( self.argv ) < 2:
            parser.print_help()
            exit( 1 )


        return (options, parser)

    def formatDay(self, year, month, day ):
        return "%.4d-%.2d-%.2d" % ( int(year), int( month ), int( day ) )

    def optionHandlingAndParsing(self):
        (options, parser) = self.getOptions()

        userName = environ[ 'USER' ]
        startDate, endDate = "", ""
        today = date.today()

        year = today.year
        month = today.month

        #print "options %s" % str( options )

        if options.start_date:
            startDate = options.start_date
            if options.end_date:
                endDate = options.end_date
            else:
                endDate = today.strftime("%m/%d/%Y" )
        elif options.week:
            week = self.getWeek( today )
            start = week[0]
            end = week[len(week) - 1]
            startDate = self.formatDay( start.year, start.month, start.day )
            endDate = self.formatDay( end.year, end.month, end.day )

        elif options.month:
            year = options.month['year'] or today.year
            month = options.month['month'] or today.month
            (weekday, length) = calendar.monthrange( int(year), int(month) )
            startDate = self.formatDay( year, month, 1 )
            endDate = self.formatDay( year, month, length )

        elif options.year:
            year = options.year['year'] or today.year
            year = int( year )
            startDate = self.formatDay( year, 1, 1 )
            endDate = self.formatDay( year, 12, 31 )
        elif options.fiscal_year:
            fiscal_year = options.fiscal_year['fiscal_year'] or today.year
            fiscal_year = int( fiscal_year )
            if month >= 1 and month <= 6:
                startDate = self.formatDay( fiscal_year-1, 01, 01 )
                endDate = self.formatDay( fiscal_year, 06, 30 )
            else:
                startDate = self.formatDay( fiscal_year, 07, 01 )
                endDate = self.formatDay( fiscal_year+1, 06, 30 )
        else:
            parser.print_help()
            exit( 1 )
        print "Start Date %s" % startDate
        print "  End Date %s\n" % endDate
        return ( userName, startDate, endDate, options.output_format)

def handle_year(line):
    """
    Handle year
    """
    m = re.match(r"^\*{1,1} (\d*)$", line)
    try:
        return int(m.group(1))
    except:
        return None

def handle_project_taskid_mapping(line):
    """
    Handle Project to Task ID Mapping
    """
    m = re.match("#\s*(.*):\s*(\d*)\s*$", line)
    try:
        project = m.group(1)
        taskid = m.group(2)
        global project_taskid_mapping
        project_taskid_mapping[project] = int(taskid)
    except:
        pass
    return None

def handle_month(line):
    """
    Handle month
    """
    m = re.match(r"^\*{2,2} (\w*)$", line)
    try:
        return m.group(1)
    except:
        return None

def handle_day(line):
    """
    Handle day.
    """
    m = re.match(r"^\*{3,3} (\d*)$", line)
    try:
        return int(m.group(1))
    except:
        return None


def handle_project(line):
    """
    Handle project.
    """
    m = re.match(r"^\*{4,4}\s(\w*)$", line)
    if m:
        try:
            project = m.group(1).strip()
            return project
        except:
            pass

    m = re.match(r"^\*{4,4}\s(\w*)\s\((\d*)\)$", line)
    if m:
        try:
            project = m.group(1)
            taskid = m.group(2)
            taskid = int(taskid.replace("(", "").replace(")", ""))
            global project_taskid_mapping
            project_taskid_mapping[project] = taskid
            return project
        except:
            pass

    return None

def handle_work(line):
    """
    Handle work.
    """
    m = re.match(r"^\*{5,5} ([-+]?\d*\.\d+|\d+) (?:hours|hour) (non-billable|billable)\. (.*)$", line)
    try:
        return {
            'length': m.group(1),
            'billable': m.group(2),
            'comment': m.group(3)}
    except:
        return None


def generate_entry_for_report(project, type, rs):
    table = Texttable()
    table.header(['Date', 'Duration', 'Comment'])
    table.set_deco(Texttable.HEADER)
    table.set_cols_dtype(['t', 'f', 't'])
    table.set_cols_align(['c', 'c', 'r'])
    table.set_cols_width([10, 8, 40])
    table.set_precision(2)
    total_hours = 0
    if len(list(rs)) == 0:
        return (0,0)

    # if project == 'WEEKEND':
    #     return (0,0)

    taskid = None
    try:
        taskid = project_taskid_mapping[project]
    except KeyError:
        pass

    for x in rs:
        total_hours += float(x.length)
        table.add_row([x.date.isoformat(), x.length, x.comment])

    if taskid:
        print 'Project: %s (%d) Total: %.2f (%d)' % (project, taskid, total_hours, type)
    else:
        print 'Project: %s Total: %.2f (%s)' % (project, total_hours, type)

    print table.draw()

def generate_entry_for_task(project, type, rs):
    taskid = None
    try:
        taskid = project_taskid_mapping[project]
    except KeyError:
        pass
    
    total_hours = 0

    buf = []

    for x in rs:
        buf.append("%s:\n  %s (%s)" % (x.date.isoformat(), x.comment, x.length))
        total_hours += float(x.length)

    if total_hours == 0:
        return

    if taskid:
        print "\nhttps://rcc.sr.unh.edu/Task/%s" % (taskid)

    print "Project: %s Total: %.2f (%s)" % (project, total_hours, type)

    print "\n".join(buf)

year = None
month = None
day = None
project = None
work = None
taskid = None

# db_filename = os.path.join( os.path.dirname(os.path.abspath(__file__)), "task.sql")
# try:
#     os.unlink(db_filename)
# except OSError:
#     None
db_filename = "/:memory:"
connection_string = "sqlite:" + db_filename
#connection_string += '?debug=True'
connection = connectionForURI(connection_string)
sqlhub.processConnection = connection

class TaskEntry(SQLObject):
    date = DateCol()
    billable = BoolCol()
    project = StringCol()
    length = FloatCol()
    comment = StringCol()
    hash = StringCol()
    taskid = IntCol()

TaskEntry.createTable()


options = OptionHandling(sys.argv)
(userName, startDate, endDate, outputFormat) = options.optionHandlingAndParsing()

sh1 = hashlib.sha1()

projects = dict()

linenum = 0
total_hours = 0
total_days = 0

task_entries = []

class MDDict(dict):
    def __init__(self, default=None):
        self.default = default

    def __getitem__(self, key):
        if not self.has_key(key):
            self[key] = self.default()
        return dict.__getitem__(self, key)

data = MDDict(dict)
from collections import defaultdict
from collections import Counter

def multi_dimensions(n, type):
  """ Creates an n-dimension dictionary where the n-th dimension is of type 'type'
  """
  if n<=1:
    return type()
  return defaultdict(lambda:multi_dimensions(n-1, type))


data = dict()

with open("task.org") as f:
    for line in f:
        linenum += 1
        line = line.strip()
        handle_project_taskid_mapping(line)
        year = handle_year(line) or year
        month = handle_month(line) or month
        day = handle_day(line) or day
        project = handle_project(line) or project
        work = handle_work(line) or None

        #print year, month, day, "\n"

        # if project == 'VACATION' or project == 'WEEKEND' or project == 'HOLIDAY':
        #     work = {
        #         'length' : 0,
        #         'billable': 'N',
        #         'comment': ''}

        if year and month and day and project and work:

            billable = work['billable'] == 'billable'
            length = float(work['length'])
            comment = work['comment']
            date = datetime.strptime("%d %s %d" % (year, month, day), "%Y %B %d")
            hash = hashlib.sha1( str(date) + str(length) + str(billable) + project + comment.strip() ).hexdigest()

            try:
                taskid = project_taskid_mapping[project]
            except KeyError:
                taskid = None

            projects[project] = 1

            rs = TaskEntry.select(TaskEntry.q.hash == hash)
            if len(list(rs)) == 0:
                te = TaskEntry(date = date,
                          hash = hash,
                          billable = billable,
                          length = length,
                          project = project,
                          taskid = taskid,
                          comment = comment.strip())

for project in projects.keys():
    if outputFormat == 'Task':
        generate_entry_for_task(project, 'Billable', TaskEntry.select(""" date between '%s' and '%s' AND billable = 1 AND project = '%s'""" % (startDate, endDate, project), orderBy=['date']) )
        generate_entry_for_task(project, 'non-billable', TaskEntry.select(""" date between '%s' and '%s' AND billable = 0 AND project = '%s'""" % (startDate, endDate, project), orderBy=['date']) )
        print "\n"

    if outputFormat == 'Report':
        generate_entry_for_report(project, 'Billable', TaskEntry.select(""" date between '%s' and '%s' AND billable = 1 AND project = '%s'""" % (startDate, endDate, project), orderBy=['date']) )
        generate_entry_for_report(project, 'non-billable', TaskEntry.select(""" date between '%s' and '%s' AND billable = 0 AND project = '%s'""" % (startDate, endDate, project), orderBy=['date']) )

query = "SELECT date, sum(length) FROM task_entry WHERE date between '%s' and '%s' GROUP BY date ORDER by 1" % (startDate, endDate)
rows = connection.queryAll(query)


print "\n"

days = hours = 0
for row in rows:
    days += 1
    hours += row[1]

    print "%s %s" % row

query = "SELECT billable, sum(length) FROM task_entry WHERE date between '%s' and '%s' GROUP BY billable ORDER by 1" % (startDate, endDate)
rows = connection.queryAll(query)

billable_total = 0
nonbillable_total = 0

for row in rows:
    if row[0] == 0:
        billable_total = row[1]
    else:
        nonbillable_total = row[1]

efficiency = 100 * (nonbillable_total / (billable_total + nonbillable_total))

print "Total Hours {} (Billable: {}, Non-billable: {})in Total Days {}, for {:.4} hours per Day".format(hours, billable_total, nonbillable_total, days, round(hours / days, 2))
print "Efficiency {:.4}".format(efficiency)

# for project in projects.keys():
#     if outputFormat == 'Task':
#         generate_entry_for_task(project, 'Billable', TaskEntry.select(""" date between '%s' and '%s' AND billable = 1 AND project = '%s'""" % (startDate, endDate, project), orderBy=['date']))
#         generate_entry_for_task(project, 'non-billable', TaskEntry.select(""" date between '%s' and '%s' AND billable = 0 AND project = '%s'""" % (startDate, endDate, project), orderBy=['date']))

#     if outputFormat == 'Report':
#         generate_entry_for_report(project, 'Billable', TaskEntry.select(""" date between '%s' and '%s' AND billable = 1 AND project = '%s'""" % (startDate, endDate, project), orderBy=['date']))
#         generate_entry_for_report(project, 'non-billable', TaskEntry.select(""" date between '%s' and '%s' AND billable = 0 AND project = '%s'""" % (startDate, endDate, project), orderBy=['date']))
