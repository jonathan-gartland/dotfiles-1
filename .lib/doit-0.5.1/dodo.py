"""dodo file. run pychecker and unittests."""

import glob

DEFAULT_TASKS = ['checker', 'ut']

codeFiles = glob.glob("lib/doit/*.py")
testFiles = glob.glob("tests/test_*.py")
pyFiles = codeFiles + testFiles

def task_checker():
    """run pyflakes on all project files"""
    for file in pyFiles:
        yield {'actions': ["pyflakes %s"% file],
               'name':file,
               'dependencies':(file,),
               'title': (lambda task: task.name)}

def task_ut():
    """run unit-tests"""
    for test in testFiles:
        yield {'name': test,
               'actions': ["py.test %s" % test],
               'dependencies': pyFiles,
               'verbosity': 0}




def task_coverage():
    """show coverage for all modules including tests"""
    return {'actions':["coverage run `which py.test`",
                   "coverage report --show-missing %s" % " ".join(pyFiles)],
            'verbosity': 2}

def task_coverage_code():
    """show coverage for all modules (exclude tests)"""
    return {'actions':["coverage run `which py.test`",
                  "coverage report --show-missing %s" % " ".join(codeFiles)],
            'verbosity': 2}

def task_coverage_module():
    """show coverage for individual modules"""
    to_strip = len('tests/test_')
    for test in testFiles:
        if not test.startswith('tests/test_'):
            continue
        source = "lib/doit/" + test[to_strip:]
        yield {'name': test,
               'actions':["coverage run `which py.test` %s" % test,
                   "coverage report --show-missing %s %s" % (source, test)],
               'verbosity': 2}