#!/usr/bin/env python

import re

class InvalidYearError(SyntaxError): pass
class InvalidMonthError(SyntaxError): pass
class InvalidDayError(SyntaxError): pass
class InvalidProjectError(SyntaxError): pass

def handle_year(line, line_number):
    """
    Handle year
    """
    m = re.match(r"^\*{1,1} (\d*)$", line)
    if m:
        return int(m.group(1))

    #raise InvalidYearError("%s %d" % (line, line_number))    

def handle_month(line, line_number):
    """
    Handle month
    """
    m = re.match(r"^\*{2,2} (\w*)$", line)
    if m:
        return m.group(1)

    #raise InvalidMonthError("%s %d" % (line, line_number))    

def handle_day(line, line_number):
    """
    Handle day.
    """
    m = re.match(r"^\*{3,3} (\d*)$", line)
    if m:
        return int(m.group(1))

    #raise InvalidDayError("%s %d" % (line, line_number))    

def handle_project(line, line_number):
    """
    Handle project.
    """
    m = re.match(r"^\*{4,4} (.*)$", line)
    if m:
        return m.group(1)

def handle_work(line, line_number):
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

    #raise InvalidProjectError("%s %d" % (line, line_number))    

year = None
month = None
day = None
project = None
work = None

data = dict()

line_number = 1
with open("task.org") as f:
    for line in f:
        line = line.strip()
        print "line: %s" % line

        y = handle_year(line, line_number)
        if y:
            year = y

        m = handle_month(line, line_number)
        if m:
            month = m

        d = handle_day(line, line_number)
        if d:
            day = d

        p = handle_project(line, line_number)
        if p:
            project = p

        w = handle_work(line, line_number)
        if w:
            work = w
        
        if year:
            if year not in data:
                data[year] = {}

            if month:
                if month not in data[year]:
                    data[year][month] = {}

                if day:
                    if day not in data[year][month]:
                        data[year][month][day] = dict()

                    if project:
                        if project not in data[year][month][day]:
                            data[year][month][day][project] = list()

                        if work:
                            data[year][month][day][project].append(work)
                            

        line_number += 1

#print "DATA ", data

# from pyparsing import *

# month = Group(oneOf('January February March April May June July August September October November December'))
# month.setName('months')

# year = Group(Word(nums))
# year.setName("year")

# day = Group(Word(nums))
# day.setName("year")

# owner = Group(Word(alphas))
# owner.setName("owner")

# weekend = Literal('WEEKEND')
# weekend.setName('weekend')
# holiday = Literal('HOLIDAY')
# holiday.setName('holiday')
# vacation = Literal('VACATION')
# vacation.setName('vacation')

# stars = dict({
#     'one': Regex(r"\*{1,1}"),
#     'two': Regex(r"\*{2,2}"),
#     'three': Regex(r"\*{3,3}"),
#     'four': Regex(r"\*{4,4}"),
#     'five': Regex(r"\*{5,5}"),2
# })

# for key in stars.viewkeys():
#     stars[key].setName( key + '_star' )

# comment = Group(ZeroOrMore(Word(printables)))
# comment.setName("comment")
# hours = Group(Regex(r"\d+(\.\d*)?").setParseAction(lambda t: float(t[0])))
# hours.setName("hours")

# task_entry = hours + Group(oneOf('hour', 'hours'))  + Group(oneOf("non-billable", "billable")) + Literal("to") + comment
# task_entry.setName("task_entry")

# task_entries = ZeroOrMore(stars['five'] + task_entry)
# owner_entries = ZeroOrMore(stars['four'] + owner + task_entries)
# day_entries = ZeroOrMore(stars['three'] + day + owner_entries)
# month_entries = ZeroOrMore(stars['two'] + month + day_entries)
# year_entries = ZeroOrMore(stars['one'] + year + month_entries)

# #year_entries.setDebug()

# with open("task.org") as f:
#     data = f.read()
#     print data
#     try:
#         rv = year_entries.parseString(data)
#         print rv
#     except ParseException, pe:
#         print "Error: ", pe
