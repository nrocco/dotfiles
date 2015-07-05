# Most of these from
#   http://sontek.net/tips-and-tricks-for-the-python-interpreter
#   http://macimproved.wordpress.com/2010/01/11/python-improved/

import os
import sys

from lswapi import *

try:
    import readline
except ImportError:
    print('Module readline not available.')
else:
    import rlcompleter
    readline.parse_and_bind('tab: complete')

    HISTFILE='{}/.python_history'.format(os.environ['HOME'])
    try:
        readline.read_history_file(HISTFILE)
    except:
        pass
    readline.set_history_length(300)

    def savehist():
        import readline
        global HISTFILE
        readline.write_history_file(HISTFILE)

    import atexit
    atexit.register(savehist)
    del atexit
finally:
    del rlcompleter
