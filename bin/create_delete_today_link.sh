#!/bin/bash

/usr/bin/env mkdir $HOME/delete/$(/usr/bin/env date +%F) 2> /dev/null
/usr/bin/env ln -sf $HOME/delete/$(/usr/bin/env date +%F) $HOME/delete/today
