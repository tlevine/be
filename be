#!/usr/bin/env python
from libbe.cmdutil import *
from libbe.bugdir import tree_root, create_bug_dir
from libbe import names, plugin, cmdutil
import sys
import os
import becommands.severity
import becommands.list
import becommands.show
import becommands.set_root
import becommands.new
import becommands.close
import becommands.open
__doc__ = """Bugs Everywhere - Distributed bug tracking

Supported becommands
 set-root: assign the root directory for bug tracking
      new: Create a new bug
     list: list bugs
     show: show a particular bug
    close: close a bug
     open: re-open a bug
 severity: %s

Unimplemented becommands
  comment: append a comment to a bug
""" % becommands.severity.__desc__



if len(sys.argv) == 1:
    cmdlist = []
    print """Bugs Everywhere - Distributed bug tracking
    
Supported commands"""
    for name, module in cmdutil.iter_commands():
        cmdlist.append((name, module.__doc__))
    for name, desc in cmdlist:
        print "%s: %s" % (name, desc)
else:
    try:
        try:
            execute(sys.argv[1], sys.argv[2:])
        except KeyError, e:
            raise UserError("Unknown command \"%s\"" % e.args[0])
        cmd(sys.argv[2:])
    except UserError, e:
        print e
        sys.exit(1)
