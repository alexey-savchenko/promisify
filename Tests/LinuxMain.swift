import XCTest

import promisifyTests

var tests = [XCTestCaseEntry]()
tests += promisifyTests.allTests()
XCTMain(tests)
