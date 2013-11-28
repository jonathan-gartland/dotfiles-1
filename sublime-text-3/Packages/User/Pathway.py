import os

LOCAL = '/usr/local/bin:/usr/local/sbin:'
HOME = '/home/skk'  ### !!! REPLACE WITH YOUR HOME PATH !!! ###
RVM = ':' + HOME + '/.rvm/bin'
RVM += ':' + HOME + '/.rvm/gems/ruby-2.0.0-p247@railstutorial_rails_4_0/bin'

# Sublime's default path is
# /usr/bin:/bin:/usr/sbin:/sbin
os.environ['PATH'] += ':'
os.environ['PATH'] += LOCAL
os.environ['PATH'] += RVM
