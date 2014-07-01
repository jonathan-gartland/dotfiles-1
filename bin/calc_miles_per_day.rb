#!/bin/env ruby

require 'date'

def parse_args
  require 'pp'
  require 'docopt'

  doc = <<DOCOPT
    Calculate miles driven per day.

    Usage:
      #{__FILE__} <start_date> <current_milage>
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


opts = parse_args
start_date = Date.parse(opts["<start_date>"])
today = Date.today
current_milage = opts["<current_milage>"].to_i

mpd =  current_milage / (today - start_date)
puts "MPD #{mpd.to_f}"
