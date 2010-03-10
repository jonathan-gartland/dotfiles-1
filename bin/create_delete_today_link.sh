#!/bin/bash

/usr/bin/env rm -f $HOME/delete/today
/usr/bin/env mkdir  $HOME/delete/$(/usr/bin/env date +%F) 
/usr/bin/env ln -sf $HOME/delete/$(/usr/bin/env date +%F) $HOME/delete/today
