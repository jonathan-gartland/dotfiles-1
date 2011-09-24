@echo off
setLocal EnableDelayedExpansion

set CLJR_HOME="/home/skk/.cljr"
set USER_HOME="/home/skk"

if not defined "%CLOJURE_HOME%" set CLOJURE_HOME=""
if not defined "%JVM_OPTS%" set JVM_OPTS=-Xmx1G

if (%1) == (repl) goto SET_CLOJURE_JARS
if (%1) == (swingrepl) goto SET_CLOJURE_JARS
if (%1) == (swank) goto SET_CLOJURE_JARS
if (%1) == (run) goto SET_CLOJURE_JARS
if (%1) == () goto SET_CLOJURE_JARS

goto LAUNCH_CLJR_ONLY

:SET_CLOJURE_JARS
     if not defined %CLOJURE_HOME% goto SET_CLASSPATH
     set CLASSPATH="
        for /R %CLOJURE_HOME% %%a in (*.jar) do (
           set CLASSPATH=!CLASSPATH!;%%a
        )
        set CLASSPATH=!CLASSPATH!"
goto SET_CLASSPATH

:SET_CLASSPATH
  set CLASSPATH="
     for /R "/home/skk/.cljr\lib" %%a in (*.jar) do (
        set CLASSPATH=!CLASSPATH!;%%a
     )
     set CLASSPATH=!CLASSPATH!"
  set CLASSPATH=%CLASSPATH%;src;test;.;/home/skk/.cljr
goto LAUNCH

:LAUNCH_CLJR_ONLY
  java %JVM_OPTS% -Dcljr.home=/home/skk/.cljr -Duser.home=/home/skk -jar "/home/skk/.cljr\cljr.jar" %*
goto EOF

:LAUNCH
  java %JVM_OPTS% -Dinclude.cljr.repo.jars=false -Dcljr.home=/home/skk/.cljr -Duser.home=/home/skk -Dclojure.home=%CLOJURE_HOME% -cp "%CLASSPATH%" cljr.App %*
goto EOF

:EOF
