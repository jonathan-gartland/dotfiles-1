import os

import py.test

from doit.dependency import Dependency
from doit.task import Task
from doit.reporter import FakeReporter
from doit import runner

# dependencies file
TESTDB = "testdb"


def my_print(*args):
    pass


def pytest_funcarg__reporter(request):
    def remove_testdb(void):
        if os.path.exists(TESTDB):
            os.remove(TESTDB)
    def create_fake_reporter():
        remove_testdb(None)
        return FakeReporter()
    return request.cached_setup(
        setup=create_fake_reporter,
        teardown=remove_testdb,
        scope="function")


class TestRunningTask(object):

    def test_success(self, reporter):
        tasks = [Task("taskX", [(my_print, ["out a"] )] ),
                 Task("taskY", [(my_print, ["out a"] )] )]
        result = runner.run_tasks(TESTDB, tasks, reporter)
        assert runner.SUCCESS == result
        assert ('start', tasks[0]) == reporter.log.pop(0)
        assert ('execute', tasks[0]) == reporter.log.pop(0)
        assert ('success', tasks[0]) == reporter.log.pop(0)
        assert ('start', tasks[1]) == reporter.log.pop(0)
        assert ('execute', tasks[1]) == reporter.log.pop(0)
        assert ('success', tasks[1]) == reporter.log.pop(0)

    # if task is up to date, it is displayed in a different way.
    def test_successUpToDate(self, reporter):
        tasks = [Task("taskX", [my_print], dependencies=[__file__])]
        result = runner.run_tasks(TESTDB, tasks, reporter)
        assert runner.SUCCESS == result
        assert ('start', tasks[0]) == reporter.log.pop(0)
        assert ('execute', tasks[0]) == reporter.log.pop(0)
        # again
        tasks2 = [Task("taskX", [my_print], dependencies=[__file__])]
        reporter2 = FakeReporter()
        result2 = runner.run_tasks(TESTDB, tasks2, reporter2)
        assert runner.SUCCESS == result2
        assert ('start', tasks2[0]) == reporter2.log.pop(0)
        assert ('up-to-date', tasks2[0]) == reporter2.log.pop(0)

    def test_ignore(self, reporter):
        tasks = [Task("taskX", [my_print], dependencies=[__file__])]
        dependencyManager = Dependency(TESTDB)
        dependencyManager.ignore(tasks[0])
        dependencyManager.close()
        result = runner.run_tasks(TESTDB, tasks, reporter)
        assert runner.SUCCESS == result
        assert ('start', tasks[0]) == reporter.log.pop(0)
        assert ('ignore', tasks[0]) == reporter.log.pop(0), reporter.log

    # whenever a task fails remaining task are not executed
    def test_failureOutput(self, reporter):
        def _fail():
            return False

        tasks = [Task("taskX", [_fail]),
                 Task("taskY", [_fail])]
        result =  runner.run_tasks(TESTDB, tasks, reporter)
        assert runner.FAILURE == result
        assert ('start', tasks[0]) == reporter.log.pop(0)
        assert ('execute', tasks[0]) == reporter.log.pop(0)
        assert ('fail', tasks[0]) == reporter.log.pop(0)
        # second task is not executed
        assert 0 == len(reporter.log)


    def test_error(self, reporter):
        def _error():
            raise Exception("I am the exception.\n")

        tasks = [Task("taskX", [_error]),
                 Task("taskY", [_error])]
        result = runner.run_tasks(TESTDB, tasks, reporter)
        assert runner.ERROR == result
        assert ('start', tasks[0]) == reporter.log.pop(0)
        assert ('execute', tasks[0]) == reporter.log.pop(0)
        assert ('fail', tasks[0]) == reporter.log.pop(0)
        # second task is not executed
        assert 0 == len(reporter.log)


    # when successful dependencies are updated
    def test_updateDependencies(self, reporter):
        filePath = os.path.join(os.path.dirname(__file__),"data/dependency1")
        ff = open(filePath,"a")
        ff.write("xxx")
        ff.close()
        dependencies = [filePath]

        filePath = os.path.join(os.path.dirname(__file__),"data/target")
        ff = open(filePath,"a")
        ff.write("xxx")
        ff.close()
        targets = [filePath]

        tasks = [Task("taskX", [my_print], dependencies, targets)]
        result = runner.run_tasks(TESTDB, tasks, reporter)
        assert runner.SUCCESS == result
        d = Dependency(TESTDB)
        # there is only one dependency. targets md5 are not saved.
        assert 1 == len(d._db)

    # when successful and run_once is updated
    def test_successRunOnce(self, reporter):
        tasks = [Task("taskX", [my_print], [True], [])]
        result = runner.run_tasks(TESTDB, tasks, reporter)
        assert runner.SUCCESS == result
        d = Dependency(TESTDB)
        assert 1 == len(d._db)


    def test_errorDependency(self, reporter):
        tasks = [Task("taskX", [my_print], ["i_dont_exist.xxx"])]
        result = runner.run_tasks(TESTDB, tasks, reporter)
        assert runner.ERROR == result
        assert ('start', tasks[0]) == reporter.log.pop(0)
        assert ('fail', tasks[0]) == reporter.log.pop(0)
        assert 0 == len(reporter.log)

    def test_ignoreNonFileDep(self, reporter):
        dep = [":taskY"]
        tasks = [Task("taskX", [my_print], dep)]
        result = runner.run_tasks(TESTDB, tasks, reporter)
        assert runner.SUCCESS == result
        d = Dependency(TESTDB)
        assert 0 == len(d._db)


    def test_alwaysExecute(self, reporter):
        tasks = [Task("taskX", [my_print], dependencies=[__file__])]
        result = runner.run_tasks(TESTDB, tasks, reporter)
        assert runner.SUCCESS == result
        assert ('start', tasks[0]) == reporter.log.pop(0)
        assert ('execute', tasks[0]) == reporter.log.pop(0)
        # again
        tasks2 = [Task("taskX", [my_print], dependencies=[__file__])]
        reporter2 = FakeReporter()
        result2 = runner.run_tasks(TESTDB, tasks2, reporter2,
                                    alwaysExecute=True)
        assert runner.SUCCESS == result2
        assert ('start', tasks2[0]) == reporter2.log.pop(0)
        assert ('execute', tasks2[0]) == reporter2.log.pop(0)


    def test_resultDependency(self, reporter):
        def ok(): return "ok"
        t1 = Task("t1", [(ok,)])
        t2 = Task("t2", [(ok,)], ['?t1'])
        result = runner.run_tasks(TESTDB, [t1, t2], reporter)
        assert ('start', t1) == reporter.log.pop(0)
        assert ('execute', t1) == reporter.log.pop(0)
        assert ('success', t1) == reporter.log.pop(0)
        assert ('start', t2) == reporter.log.pop(0)
        assert ('execute', t2) == reporter.log.pop(0)
        assert ('success', t2) == reporter.log.pop(0)
        # again
        result = runner.run_tasks(TESTDB, [t1, t2], reporter)
        assert ('start', t1) == reporter.log.pop(0)
        assert ('execute', t1) == reporter.log.pop(0)
        assert ('success', t1) == reporter.log.pop(0)
        assert ('start', t2) == reporter.log.pop(0)
        assert ('up-to-date', t2) == reporter.log.pop(0)
        # change t1, t2 executed again
        def ok2(): return "different"
        t1B = Task("t1", [(ok2,)])
        result = runner.run_tasks(TESTDB, [t1B, t2], reporter)
        assert ('start', t1B) == reporter.log.pop(0)
        assert ('execute', t1B) == reporter.log.pop(0)
        assert ('success', t1B) == reporter.log.pop(0)
        assert ('start', t2) == reporter.log.pop(0)
        assert ('execute', t2) == reporter.log.pop(0)
        assert ('success', t2) == reporter.log.pop(0)


class TestTaskSetup(object):

    class SetupSample(object):
        def __init__(self):
            self.executed = 0
            self.cleaned = 0

        def setup(self):
            self.executed += 1

        def cleanup(self):
            self.cleaned += 1

    def testExecuted(self, reporter):
        setup = self.SetupSample()
        t = Task("ss", None, [], [], [setup])
        result = runner.run_tasks(TESTDB, [t], reporter)
        assert runner.SUCCESS == result
        assert 1 == setup.executed
        assert 1 == setup.cleaned

    def testExecuteOnce(self, reporter):
        setup = self.SetupSample()
        t1 = Task("ss", None, [], [], [setup])
        t2 = Task("ss2", None, [], [], [setup])
        result = runner.run_tasks(TESTDB, [t1, t2], reporter)
        assert runner.SUCCESS == result
        assert 1 == setup.executed
        assert 1 == setup.cleaned

    def testExecuteCleanedOnTaskErrors(self, reporter):
        setup = self.SetupSample()
        def bad_seed():
            raise Exception("rrrr")
        t1 = Task("ss", [bad_seed], [], [], [setup])
        t2 = Task("ss2", None, [], [], [setup])
        result = runner.run_tasks(TESTDB, [t1, t2], reporter)
        assert runner.ERROR == result
        assert 1 == setup.executed
        assert 1 == setup.cleaned

    def testSetupError(self, reporter):
        # it is same as a task error
        def raise_something():
            raise Exception('xxx')
        setup = self.SetupSample()
        setup.setup = raise_something
        t1 = Task('t1', None, [], [], [setup])
        result = runner.run_tasks(TESTDB, [t1], reporter)
        assert runner.ERROR == result
        # TODO not checking error is written to output

    def testCleanupError(self, reporter):
        # ignore errors...
        def raise_something():
            raise Exception('xxx')
        setup = self.SetupSample()
        setup.cleanup = raise_something
        t1 = Task('t1', None, [], [], [setup])
        result = runner.run_tasks(TESTDB, [t1], reporter)
        assert runner.SUCCESS == result
        assert ('start', t1) == reporter.log.pop(0)
        assert ('execute', t1) == reporter.log.pop(0)
        assert ('success', t1) == reporter.log.pop(0)
        assert ('cleanup_error',) == reporter.log.pop(0)


class TestContinue(object):
    def test_(self, reporter):
        def please_fail():
            return False
        def please_blow():
            raise Exception("bum")
        def ok():
            pass
        tasks = [Task("task1", [(please_fail,)] ),
                 Task("task2", [(please_blow,)] ),
                 Task("task3", [(ok,)])]
        result = runner.run_tasks(TESTDB,tasks, reporter, continue_=True)
        assert runner.ERROR == result
        assert ('start', tasks[0]) == reporter.log.pop(0)
        assert ('execute', tasks[0]) == reporter.log.pop(0)
        assert ('fail', tasks[0]) == reporter.log.pop(0)
        assert ('start', tasks[1]) == reporter.log.pop(0)
        assert ('execute', tasks[1]) == reporter.log.pop(0)
        assert ('fail', tasks[1]) == reporter.log.pop(0)
        assert ('start', tasks[2]) == reporter.log.pop(0)
        assert ('execute', tasks[2]) == reporter.log.pop(0)
        assert ('success', tasks[2]) == reporter.log.pop(0)
        assert 0 == len(reporter.log)


class TestSystemExit(object):

    # SystemExit runner should interfere with SystemExit
    def testRaises(self, reporter):
        def i_raise():
            raise SystemExit()
        t1 = Task("x", [i_raise])
        py.test.raises(SystemExit, runner.run_tasks, TESTDB, [t1], reporter)