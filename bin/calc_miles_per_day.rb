#!/bin/env ruby

require 'date'

def parse_args
  require 'pp'
  require 'docopt'

  doc = <<DOCOPT
    Calculate miles driven per day.

    Usage:
      #{__FILE__} <current_milage>
      #{__FILE__} -h | --help

    Options:
      -h --help     Show this screen.
DOCOPT

  begin
    opts = Docopt::docopt(doc)
    #pp opts
    return opts
  rescue Docopt::Exit => e
    puts e.message
    exit
  end
end


START_DATE = Date.parse("2010-01-07")
START_MILEAGE = 67481

opts = parse_args
current_milage = opts["<current_milage>"].to_i

mpd = (current_milage - START_MILEAGE) / (Date.today - START_DATE)
puts printf("%3.2f", mpd.to_f)
