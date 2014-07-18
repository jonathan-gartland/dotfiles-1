def get_imap_password(*path):
    from os.path import join, expanduser
    filepath = expanduser(join(*path))

    with open(filepath) as f:
        content = f.read().splitlines()
        if len(content) > 0:
            return content[0]

        return ""

def which(program):

    import shutil
    if hasattr(shutil, 'which'):
        return shutil.which("mpd")


    def is_exe(fpath):
        return os.path.exists(fpath) and os.access(fpath, os.X_OK)

    def ext_candidates(fpath):
        yield fpath
        for ext in os.environ.get("PATHEXT", "").split(os.pathsep):
            yield fpath + ext

    fpath, fname = os.path.split(program)
    if fpath:
        if is_exe(program):
            return program
    else:
        for path in os.environ["PATH"].split(os.pathsep):
            exe_file = os.path.join(path, program)
            for candidate in ext_candidates(exe_file):
                if is_exe(candidate):
                    return candidate

    return None


