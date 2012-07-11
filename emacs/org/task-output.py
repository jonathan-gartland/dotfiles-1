#!/usr/bin/env python

from pyparsing import *

month = Group(oneOf('January February March April May June July August September October November December'))
month.setName('months')

year = Group(Word(nums))
year.setName("year")

day = Group(Word(nums))
day.setName("year")

owner = Group(Word(alphas))
owner.setName("owner")

weekend = Literal('WEEKEND')
weekend.setName('weekend')
holiday = Literal('HOLIDAY')
holiday.setName('holiday')
vacation = Literal('VACATION')
vacation.setName('vacation')

stars = dict({
    'one': Regex(r"\*{1,1}"),
    'two': Regex(r"\*{2,2}"),
    'three': Regex(r"\*{3,3}"),
    'four': Regex(r"\*{4,4}"),
    'five': Regex(r"\*{5,5}"),
})

for key in stars.viewkeys():
    stars[key].setName( key + '_star' )

comment = Group(ZeroOrMore(Word(printables)))
comment.setName("comment")
hours = Group(Regex(r"\d+(\.\d*)?").setParseAction(lambda t: float(t[0])))
hours.setName("hours")

task_entry = hours + Group(oneOf('hour', 'hours'))  + Group(oneOf("non-billable", "billable")) + Literal("to") + comment
task_entry.setName("task_entry")

task_entries = ZeroOrMore(stars['five'] + task_entry)
owner_entries = ZeroOrMore(stars['four'] + owner + task_entries)
day_entries = ZeroOrMore(stars['three'] + day + owner_entries)
month_entries = ZeroOrMore(stars['two'] + month + day_entries)
year_entries = ZeroOrMore(stars['one'] + year + month_entries)

#year_entries.setDebug()

with open("task.org") as f:
    data = f.read()
    print data
    try:
        rv = year_entries.parseString(data)
        print rv
    except ParseException, pe:
        print "Error: ", pe
