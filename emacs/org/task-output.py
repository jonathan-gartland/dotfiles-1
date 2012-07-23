#!/usr/bin/env python

import re
import os.path
from sqlobject import *
import datetime
import hashlib
from FormatTable import print_table
from texttable import Texttable
from sys import argv
from option_handling import OptionHandling
from optparse import OptionParser
from os import environ
from time import *
from datetime import datetime, date
import calendar

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

    if len( value ) == 0:
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


    def getOptions( self ):
        parser = OptionParser()
        parser.add_option("-w", "--week",       dest="week",        help="Task for this Week",  action="store_true" )
        parser.add_option("-m", "--month",      dest="month",       help="Task for this Month [Month Year]", action="callback", callback=parseArgs )
        parser.add_option("-y", "--year",       dest="year",        help="Task for Year [ Year ]", action="callback", callback=parseArgs )
        parser.add_option("-f", "--fiscal_year",    dest="fiscal_year", help="Task for Year [ Fiscal Year ]", action="callback", callback=parseArgs )
        parser.add_option("-s", "--start_date",         dest="start_date",  help="Task for Start Date [ MM/DD/YYYY ]", action="store" )
        parser.add_option("-e", "--end_date",       dest="end_date",  help="Task for End Date [ MM/DD/YYYY ]", action="store" )


        (options, args) = parser.parse_args( args = self.argv )

        if len( self.argv ) < 2:
            parser.print_help()
            exit( 1 )


        return ( options, parser )

    def formatDay( self, year, month, day ):
        return "%.4d-%.2d-%.2d" % ( int( year ), int( month ), int( day ) )

    def optionHandlingAndParsing( self ):
        ( options, parser ) = self.getOptions()

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
            startDate = self.formatDay( year, month, 01 )
            endDate = self.formatDay( year, month, length )

        elif options.year:
            year = options.year['year'] or today.year
            year = int( year )
            startDate = self.formatDay( year, 01, 01 )
            endDate = self.formatDay( year, 12, 31 )
        elif options.fiscal_year:
            fiscal_year = options.fiscal_year['fiscal_year'] or today.year
            fiscal_year = int( fiscal_year )
            if month >= 1 and month <= 6:
                startDate = self.formatDay( fiscal_year-1, 07, 01 )
                endDate = self.formatDay( fiscal_year, 06, 30 )
            else:
                startDate = self.formatDay( fiscal_year, 07, 01 )
                endDate = self.formatDay( fiscal_year+1, 06, 30 )
        else:
            parser.print_help()
            exit( 1 )

        print "Start Date %s" % startDate
        print "  End Date %s\n" % endDate

        return ( userName, startDate, endDate )

def handle_year(line):
    """
    Handle year
    """
    m = re.match(r"^\*{1,1} (\d*)$", line)
    if m:
        return int(m.group(1))

def handle_month(line):
    """
    Handle month
    """
    m = re.match(r"^\*{2,2} (\w*)$", line)
    if m:
        return m.group(1)

def handle_day(line):
    """
    Handle day.
    """
    m = re.match(r"^\*{3,3} (\d*)$", line)
    if m:
        return int(m.group(1))

def handle_project(line):
    """
    Handle project.
    """
    m = re.match(r"^\*{4,4} (.*)$", line)
    if m:
        return m.group(1)

def handle_work(line):
    """
    Handle work.
    """
    m = re.match(r"^\*{5,5} ([-+]?\d*\.\d+|\d+) (?:hours|hour) (non-billable|billable) to (.*)\. (.*)$", line)
    if m:
        return {
            'length' : m.group(1),
            'billable': m.group(2),
            'owner' : m.group(3),
            'comment': m.group(4)}

def generate_entry_for_task(type, rs):
    table = Texttable()
    table.header(['Date', 'Duration', 'Comment'])
    table.set_cols_dtype(['t', 'f', 't'])
    table.set_precision(2)
    total = 0
    for x in rs:
        total += float(x.length)
        table.add_row([x.date.isoformat(), x.length, x.comment])

    print '%s Total: %.2f' % (type, total)
    print table.draw() + "\n"
    
year = None
month = None
day = None
project = None
work = None

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

TaskEntry.createTable()


options = OptionHandling( argv )
( userName, startDate, endDate ) = options.optionHandlingAndParsing()

sh1 = hashlib.sha1()

with open("task.org") as f:
    for line in f:
        line = line.strip()
        #print line
        y = handle_year(line)
        if y:
            year = y

        m = handle_month(line)
        if m:
            month = m

        d = handle_day(line)
        if d:
            day = d

        p = handle_project(line)
        if p:
            project = p

        w = handle_work(line)
        if w:
            work = w

        if year and month and day and project and work:
            billable = work['billable'] == 'billable'
            length = float(work['length'])
            comment = work['comment']
            owner = work['owner']
            date = datetime.strptime("%d %s %d" % (year, month, day), "%Y %B %d")
            hash = hashlib.sha1( str(date) + str(length) + str(billable) + project + comment.strip() ).hexdigest()

            rs = TaskEntry.select(TaskEntry.q.hash == hash)
            if len(list(rs)) == 0:
                TaskEntry(date = date,
                          hash = hash,
                          billable = billable,
                          length = length,
                          project = owner,
                          comment = comment.strip())

generate_entry_for_task( 'Billable', TaskEntry.select(""" date between '%s' and '%s' AND billable = 1""" % (startDate, endDate), orderBy=['date']) )
generate_entry_for_task( 'Non-billable', TaskEntry.select(""" date between '%s' and '%s' AND billable = 0""" % (startDate, endDate), orderBy=['date']) )

