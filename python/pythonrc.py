# Most of these from http://sontek.net/tips-and-tricks-for-the-python-interpreter
import os
import sys
import logging
import re
import datetime

logging.basicConfig(format='[%(asctime)s] %(message)s', level=logging.DEBUG)

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

    # Enable a History
    HISTFILE="%s/.python_history" % os.environ["HOME"]

    # Read the existing history if there is one
    try:
        readline.read_history_file(HISTFILE)
    except:
        pass

    # Set maximum number of items that will be written to the history file
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


# Enable Pretty Printing for stdout
def my_displayhook(value):
    if value is not None:
        try:
            import __builtin__
            __builtin__._ = value
        except ImportError:
            __builtins__._ = value

        import pprint
        pprint.pprint(value)
        del pprint

sys.displayhook = my_displayhook
