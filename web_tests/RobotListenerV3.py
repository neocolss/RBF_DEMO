import os.path
import tempfile

from robot.libraries.BuiltIn import BuiltIn


class RobotListenerV3:
    ROBOT_LIBRARY_SCOPE = "GLOBAL"
    ROBOT_LISTENER_API_VERSION = 3

    def __init__(self, filename='listenV3.txt'):
        outpath = os.path.join(tempfile.gettempdir(), filename)
        self.outfile = open(outpath, 'w')

    def start_suite(self, suite, result):
        self.outfile.write("%s '%s'\n" % (suite.name, result.name))

    def start_test(self, test, result):
        self.outfile.write("%s '%s'\n" % (test.name, result.name))

    def end_test(self, test, result):
        self.outfile.write("%s '%s'\n" % (test.name, result.status))

    def end_suite(self, suite, result):
        pass

    def log_message(self, message):
        pass

    def message(self, message):
        pass

    def debug_file(self, path):
        pass

    def output_file(self, path):
        pass

    def xunit_file(self, path):
        pass

    def log_file(self, path):
        pass

    def report_file(self, path):
        pass

    def close(self):
        pass
