#!/usr/bin/env python

import re
import os.path
from sqlobject import *
import datetime

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
        print m.groups()
        return {
            'length' : m.group(1),
            'billable': m.group(2),
            'owner' : m.group(3),
            'comment': m.group(4)}

year = None
month = None
day = None
project = None
work = None

db_filename = os.path.abspath("task-output.sql") 
if os.path.exists(db_filename):
    os.unlink(db_filename)
connection_string = "sqlite:" + db_filename
connection_string += '?debug=True'
connection = connectionForURI(connection_string)
sqlhub.processConnection = connection

class TaskEntry(SQLObject):
    date = DateCol()
    billable = BoolCol()
    project = StringCol()
    length = FloatCol()
    comment = StringCol()

TaskEntry.createTable()

with open("task.org") as f:
    for line in f:
        line = line.strip()
        print line
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
            print work
            date = datetime.datetime.strptime("%d %s %d" % (year, month, day), "%Y %B %d")
            TaskEntry(date = date,
                      billable = billable,
                      length = length,
                      project = owner,
                      comment = comment)

for x in TaskEntry.select(""" date between '2012-07-1' and '2012-07-31' AND billable = 1""", orderBy=['date']):
    print x.date, x.comment, "\n"
