# $Id: config.fish 2673 2009-05-12 00:46:37Z skk $

#
# General Aliases
#
alias cp 'cp -i'
alias df 'df -h'
alias du 'du -h'
alias grep 'grep --color=auto'
alias la 'ls -al'	 # show hidden files

alias lc 'ls -lcr'	# sort by change time
alias lk 'ls -lSr'	# sort by size
alias ll 'ls -l'            
alias lm 'ls -al |less'	    # pipe through 'more'
alias lR 'ls -lR'	 # recursive ls	
alias lr 'ls -ltr'	# sort by date DSC
alias ls 'ls -hF --color'			 # add colors for filetype recognition
alias lC 'ls -hF --color=never'			 # add colors for filetype recognition
alias lt 'ls -lt'	# sort by date ASC
alias lu 'ls -lur'	# sort by access time
alias lx 'ls -lXB'	# sort by extension	
alias mkdir 'mkdir -p'										 
alias more 'less'
alias mv 'mv -i'
alias pl 'tail -f -n 30 $HOME/.procmail/log/procmail'
alias putty 'set TERM=putty'
alias rm 'rm -i'
alias today 'date +%F'
alias todayISO1806 'date -u +"%FT%TZ"'
alias tree 'tree -Csuh'	    # nice alternative to 'ls'
alias vgrep 'grep -nH'
alias watch 'watch -n 1'
alias home 'ssh skk.ath.cx'
alias rcc 'ssh zathras.sr.unh.edu'
alias cis 'ssh skknight@turing.unh.edu'
alias pyMemoryReport 'sudo $HOME/bin/ps_mem.py' # only works on a system with $USER has sudo rights
alias ant 'ant -logger org.apache.tools.ant.listener.AnsiColorLogger -lib $HOME/CRMS/build/lib/jdepend-2.9/lib/jdepend-2.9.jar'

#
# Environment variables
#
set -e PAGER
if test -n $PAGER; and test ( type most )
    set PAGER most 
end
if test -z $PAGER; and test ( type less )
    set PAGER less 
end
if test -z $PAGER; and test ( type more )
    set PAGER more
end

set stow $HOME/local/stow

# setup CDPATH
setupCDPATH

# setup PATH
setupPATH

set MANPATH $MANPATH $HOME/local/man
set TERMINFO $HOME/.terminfo

#
# General variablles
#

# svn variables
set svndemo "https://svn.sr.unh.edu/svn/demo/"
set svnskk "https://svn.sr.unh.edu/svn/skk/"
set svnevents "https://svn.sr.unh.edu/svn/Events/"
set svnescat "https://svn.sr.unh.edu/svn/eSCAT/"
set svncrms "https://svn.sr.unh.edu/svn/CRMS/"
set svntv "https://svn.sr.unh.edu/svn/TwinView/"
set svneos "https://svn.sr.unh.edu/svn/EOS/"
set svnseagrant "https://svn.sr.unh.edu/svn/SeaGrant/"
set svnproject54 "https://svn.sr.unh.edu/svn/Project54/"
set svnsharedperlmodules "https://svn.sr.unh.edu/svn/SharedPerlModules/"
set svnerma "https://erma-svn.sr.unh.edu/svn/trunk"
    
/usr/bin/env python -c "import sys;print 'python' + str(sys.version_info[0]) + '.' + str(sys.version_info[1])" | read python_version 

# fish stuff for RCC
if test (/bin/dnsdomainname) = "sr.unh.edu"

    # misc rcc-specific aliases
    alias coverops 'ssh blackstar /usr/local/bin/coverops'
    
    # misc rcc-specific aliases/sets
    alias z0 "set DISPLAY 'zathras.sr.unh.edu:0.0'"
    alias c0 "set DISPLAY 'chong.sr.unh.edu:0.0'"
    alias c1 "set DISPLAY 'cheech.sr.unh.edu:0.0'"

    # setup oracle environment variables
    setup_oracle_env
end

# fish stuff for zathras
if test (hostname) = 'zathras.sr.unh.edu' 
    # General Aliases
    alias bigmomma '/usr/bin/vncviewer -FullColor bigmomma'

    # Environmental variablles
    set -xg ECLIPSE_HOME /usr/local/eclipse
    set -xg PYTHONDOCS "/usr/share/doc/python-docs-2.6/html/"
    set -xg LD_LIBRARY_PATH $HOME/local/lib:$LD_LIBRARY_PATH

    set -xg JAVA_HOME /usr/local/java/IBMJava16
    set -xg JRE_HOME $JAVA_HOME
    set -xg PRINTER HP-Color-LaserJet-3800
    set -xg MAILDIR $HOME/Maildir
    
    # Database aliases
    set -xg ORACLE_COMMAND $HOME/bin/pysql.sh

    # source IBM WebSphere AS 6.1 setup file
    /opt/IBM/setup_was/setup_was.py | .

    # catlab
    alias catlab-dev 'pushd $PWD; pysql.sh ***REMOVED***; popd'
    alias catlab 'pushd $PWD; pysql.sh ***REMOVED***; popd'

    # layout
    alias layout-dev 'pushd $PWD; pysql.sh ***REMOVED***; popd'

    # events
    alias events-dev 'pushd $PWD; pysql.sh ***REMOVED***; popd'
    alias events 'pushd $PWD; pysql.sh ***REMOVED***; popd'

    # alumni
    alias alumni-dev 'pushd $PWD; pysql.sh ***REMOVED***; popd'
    alias alumni 'pushd $PWD; pysql.sh ***REMOVED***; popd'

    # seagrant
    alias seagrant-dev 'pushd $PWD; pysql.sh ***REMOVED***; popd'
    alias seagrant 'pushd $PWD; pysql.sh ***REMOVED***; popd'

    # eos
    alias eos 'pushd $PWD; pysql.sh ***REMOVED***; popd'
    alias eos-dev 'pushd $PWD; pysql.sh ***REMOVED***; popd'
    
    # mysql
    alias fms-dev '***REMOVED***'
    alias fms-win '***REMOVED***'

    # xask options
    set -x XASK_TERMINAL "/usr/bin/konsole"
end

# fish stuff for kona and kenyan
if test (hostname) = 'kona.sr.unh.edu'
    set -gx JAVA_HOME /usr/local/java/IBMJava16
    set -gx JRE_HOME $JAVA_HOME

     # source IBM WebSphere AS 6.1 setup file
    /opt/IBM/setup_was/setup_was.py | .
end

if test (hostname) = 'spoo.sr.unh.edu'
    set -gx JAVA_HOME /usr/local/java/IBMJava16
    set -gx JRE_HOME $JAVA_HOME
     # source IBM WebSphere AS 6.1 setup file
    /opt/IBM/setup_was/setup_was.py | .
end


# fish stuff for home
if test (hostname) = 'skk'
    set svnroot "file:///home/svn/skk/"
    set svnmusic "file:///home/svn/music/"
    set -gx MAILDIR $HOME/Maildir
    set -x JAVA_HOME /usr/local/java/IBMJava16
    set -x JRE_HOME $JAVA_HOME
    cd
end

# add JAVA_HOME/bin to PATH
addToPATH $JAVA_HOME/bin

set -gx PYTHONPATH $HOME/.emacs.d/python/lib/$python_version/site-packages/ $HOME/.emacs.d/elisp/gpycomplete $HOME/local/lib/$python_version/site-packages/ $HOME/local/stow/lib/

# set EDITOR/VISUAL
set -gx EDITOR ew
set -gx VISUAL ew
# /* vim: set filetype=fish : */ 


cd .
