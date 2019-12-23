// Test Anything Protocol - Producer Module
// Header File
//
// An example test file output by this libary may look like:
//    
//    1..4
//    ok 1 - Input file opened
//    not ok 2 - First line of the input valid
//    ok 3 - Read the rest of the file
//    not ok 4 - Summarized correctly # TODO Not written yet
//
// # The plan
// The plan tells how many tests will be run, or how many tests have run. 
// It’s a check that the test file hasn’t stopped prematurely. It must appear 
// once, whether at the beginning or end of the output. The plan is usually the 
// first line of TAP output (although in future there may be a version line 
// before it) and it specifies how many test points are to follow. 
// For example, 
//     1..10
// means you plan on running 10 tests. This is a safeguard in case your test 
// file dies silently in the middle of its run. The plan is optional but if 
// there is a plan before the test points it must be the first non-diagnostic 
// line output by the test file. In certain instances a test file may not know 
// how many test points it will ultimately be running. In this case the plan can 
// be the last non-diagnostic line in the output. The plan cannot appear in the 
// middle of the output, nor can it appear more than once.
// 
// # The test line
// The core of TAP is the test line. A test file prints one test line per test 
// point executed. There must be at least one test line in TAP output. Each test 
// line comprises the following elements:
// 
//     ok or not ok
// This tells whether the test point passed or failed. It must be at the 
// beginning of the line. /^not ok/ indicates a failed test point. /^ok/ is a 
// successful test point. This is the only mandatory part of the line. Note that
// unlike the Directives below, ok and not ok are case-sensitive.
// 
// # Test number
// TAP expects the ok or not ok to be followed by a test point number. 
// 
// # Description
// Any text after the test number but before a # is the description of the test 
// point.
// 
//     ok 42 this is the description of the test
//
// # Directive
// The test point may include a directive, after a hash on the test line. 
// There are currently two directives allowed: TODO and SKIP. Hashes at the 
// beginning of a line are considered comments.
//
// # E
// 
// MIT License
// 
// Copyright (c) 2019 Érico Vieira Porto 
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#define NO_PLAN -1
#define SKIP_ALL -2
#define DEFAULT_TEST_FILENAME "agstest.log"

struct tap{
  
  /// removes previously outputed test log files if they exist.
  import static void clean_test();
  
  /// tells how many tests will be run. Use NO_PLAN if no plan, or SKIP_ALL to not output log.
  import static void plan(int n,  String skip_reason = 0);
  
  /// This test will succeed if the condition is true, and fail if the condition is false.
  import static void ok(bool condition, String test_name = 0);
  
  /// This test will succeed if the condition is false, and fail if the condition is true.
  import static void nok(bool condition, String test_name = 0);
  
  /// This test will succeed if `got` and `expected` matches. 
  import static void is(String got,  String expected, String test_name = 0);
  
  /// This test will succeed if `got` and `expected` does not matches.
  import static void isnt(String got,  String expected, String test_name = 0);
  
  /// This test will succeed if `got` and `expected` matches. 
  import static void is_int(int got,  int expected, String test_name = 0);
  
  /// This test will succeed if `got` and `expected` does not matches.
  import static void isnt_int(int got,  int expected, String test_name = 0);
  
  /// This test will succeed if `got` and `expected` matches. 
  import static void is_float(float got,  float expected, float epsilon, String test_name = 0);
  
  /// This test will succeed if `got` and `expected` does not matches.
  import static void isnt_float(float got,  float expected, float epsilon, String test_name = 0);
  
  /// when you are done with a plan, do tap.done_testing()
  import static void done_testing();
  
  /// outputs a small summary of currently tests and failures.
  import static void Harness();
};