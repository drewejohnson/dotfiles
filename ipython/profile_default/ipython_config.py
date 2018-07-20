"""
Config options for ipython
"""

c = get_config()
c.InteractiveShellApp.exec_lines = [
    'from importlib import reload',
    'import numpy',
    'from matplotlib import pyplot',
]

c.InteractiveShell.editor = 'vim'

