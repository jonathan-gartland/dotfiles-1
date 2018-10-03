#!/usr/bin/env python3

from os import scandir
from sys import argv
from platform import uname
from pathlib import Path


# TODO: re-write to run in py2 because install.py is written for python3 and run
#  dotbot (e.g. /Users/steven.knight/.repos/dotbot/bin/dotbot) is run it fails
#  Error: pyenv: python3: command not found
#  re-write in rust ??

filename_template = """
# -------------------------------------------------------------------------------
# filename: {filename}
# -------------------------------------------------------------------------------
{data}
# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------
"""


def read_and_format_data(filename, outbuf):
    """
    Read file and format

    Args:
        filename:

    Returns:
        str

    """

    with open(filename, 'r') as inbuf:
        data = inbuf.read()
        data = filename_template.format(filename=filename,
                                        data=data)
        outbuf.write(data)


def main(args):
    parent_dir = Path(args[0]).parent
    lib_dir = parent_dir.joinpath('lib')
    hostname = uname()[1]
    local_dir = parent_dir.joinpath('local')

    outfilename = parent_dir.joinpath("zsh_plugins.zsh")

    with open(str(outfilename), 'w') as outbuf:
        for filename in scandir(str(local_dir)):
            filename = Path(filename.path)
            if filename.stem == hostname:
                read_and_format_data(str(filename), outbuf)

        for filename in scandir(str(lib_dir)):
            read_and_format_data(filename.path, outbuf)


if __name__ == "__main__":
    main(argv)
