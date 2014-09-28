# Most of these from
#   http://sontek.net/tips-and-tricks-for-the-python-interpreter
#   http://macimproved.wordpress.com/2010/01/11/python-improved/

import os
import sys

try:
    import readline
except ImportError:
    print("Module readline not available.")
else:
    import rlcompleter
    if(sys.platform == 'darwin'):
        readline.parse_and_bind ("bind ^I rl_complete")
    else:
        readline.parse_and_bind("tab: complete")

    HISTFILE="%s/.python_history" % os.environ["HOME"]
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
