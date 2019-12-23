# ags_test_game

[![Build status](https://ci.appveyor.com/api/projects/status/2qakyfoixd50r78g?svg=true)](https://ci.appveyor.com/project/ericoporto/ags-test-game)

## Test Anything Protocol - AGS Module

The Module implements Test Anything Protocol for Adventure Game Studio. You
can read more on it here: [testanything.org](https://testanything.org/)

An example test file output by this libary may look like:
   
    1..4
    ok 1 - Input file opened
    not ok 2 - First line of the input valid
    ok 3 - Read the rest of the file
    not ok 4 - Summarized correctly # TODO Not written yet

### The plan
The plan tells how many tests will be run, or how many tests have run. 
It’s a check that the test file hasn’t stopped prematurely. It must appear 
once, whether at the beginning or end of the output. The plan is usually the 
first line of TAP output (although in future there may be a version line 
before it) and it specifies how many test points are to follow. 
For example, 

    1..10

means you plan on running 10 tests. This is a safeguard in case your test 
file dies silently in the middle of its run. The plan is optional but if 
there is a plan before the test points it must be the first non-diagnostic 
line output by the test file. In certain instances a test file may not know 
how many test points it will ultimately be running. In this case the plan can 
be the last non-diagnostic line in the output. The plan cannot appear in the 
middle of the output, nor can it appear more than once.

### The test line
The core of TAP is the test line. A test file prints one test line per test 
point executed. There must be at least one test line in TAP output. Each test 
line comprises the following elements:

    ok or not ok

This tells whether the test point passed or failed. It must be at the 
beginning of the line. /^not ok/ indicates a failed test point. /^ok/ is a 
successful test point. This is the only mandatory part of the line. Note that
unlike the Directives below, ok and not ok are case-sensitive.

### Test number
TAP expects the ok or not ok to be followed by a test point number. 

### Description
Any text after the test number but before a # is the description of the test 
point.

    ok 42 this is the description of the test

### Directive
The test point may include a directive, after a hash on the test line. 
There are currently two directives allowed: TODO and SKIP. Hashes at the 
beginning of a line are considered comments.

## Executing tap with AGS

Before running any test, remove any leftover files and from a previous run, by
running a clean test.

    tap.clean_test()

By default, test is printed to a file named `agstest.log` on the saved games
directory for the game under test.

If you have a plan, state it before starting out.

    tap.plan(3);

Then run the needed tests.

    String null_string;
    tap.ok(String.IsNullOrEmpty(null_string), "String.IsNullOrEmpty test null string");
    tap.ok(String.IsNullOrEmpty(""), "String.IsNullOrEmpty test empty string");
    tap.ok(!String.IsNullOrEmpty("with text"), "String.IsNullOrEmpty test non-empty string");

After you are done testing, state it.

    tap.done_testing();

## TAP AGS Script API

### tap.clean_test
    void tap.clean_test()

This command removes previously outputed test log files if they exist. 

### tap.plan
    void tap.plan(int n,  String skip_reason = 0)

This allows setting a plan, so we know how many tests will be run. Just use it
once for the group of tests following. If you want to start a new test, after
a plan has been set, remember to call `tap.done_testing()` before.

Alternatively, you can pass `NO_PLAN` if you have no plan.

If the following tests are to be skipped, pass `SKIP_ALL`, so all tests until
next plan are skipped. They will still be executed, they just won't output log 
or be considered whether they fail or succeed.

### tap.ok
    void tap.ok(bool condition, String test_name = 0)

This test will succeed if the condition is true, and fail if the condition is 
false.

### tap.nok
    void tap.nok(bool condition, String test_name = 0)

This test will succeed if the condition is false, and fail if the condition is 
true.

### tap.is
    void tap.is(String got,  String expected, String test_name = 0)

This test will succeed if `got` and `expected` matches. If this test fails,
we can have some more diagnostic information since we know both inputs and the
premise they are supposed to match.

### tap.isnt
    void tap.isnt(String got,  String expected, String test_name = 0)

This test will succeed if `got` and `expected` does not matches. If this test 
fails, we can have some more diagnostic information since we know both inputs 
and the premise they are not supposed to match.

### tap.is_int
    void tap.is_int(int got,  int expected, String test_name = 0)

This test will succeed if `got` and `expected` matches. If this test fails,
we can have some more diagnostic information since we know both inputs and the
premise they are supposed to match. This is for `int` values.

### tap.isnt_int
    void tap.isnt_int(int got,  int expected, String test_name = 0)

This test will succeed if `got` and `expected` does not matches. If this test 
fails, we can have some more diagnostic information since we know both inputs 
and the premise they are not supposed to match. This is for `int` values.

### tap.is_float
    void tap.is_float(float got,  float expected, float epsilon, String test_name = 0)

This test will succeed if `got` and `expected` matches. If this test fails,
we can have some more diagnostic information since we know both inputs and the
premise they are supposed to match. This is for `float` values.

### tap.isnt_float
    void tap.isnt_float(float got,  float expected, float epsilon, String test_name = 0)

This test will succeed if `got` and `expected` does not matches. If this test 
fails, we can have some more diagnostic information since we know both inputs 
and the premise they are not supposed to match. This is for `float` values.

### tap.done_testing
    void tap.done_testing()

After you are done testing, before calling the next plan, state you are done
testing.

### tap.Harness
    void tap.Harness()

This outputs a small summary of currently tests and failures. Don't depend on
this output format.


## Author

Made by Érico Vieira Porto


## License

Distributed under MIT license. See [LICENSE](https://github.com/ericoporto/ags_test_game/blob/master/LICENSE) for more information.


