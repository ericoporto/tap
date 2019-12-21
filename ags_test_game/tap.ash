// new module header
#define NO_PLAN -1
#define SKIP_ALL -2
#define DEFAULT_TEST_FILENAME "agstest.log"

import void clean_test();
import void plan(int n,  String skip_reason = 0);
import void ok(bool condition, String test_name = 0);
import void nok(bool condition, String test_name = 0);
import void is(String got,  String expected, String test_name = 0);
import void isnt(String got,  String expected, String test_name = 0);
import void is_int(int got,  int expected, String test_name = 0);
import void isnt_int(int got,  int expected, String test_name = 0);
import void is_float(float got,  float expected, float epsilon, String test_name = 0);
import void isnt_float(float got,  float expected, float epsilon, String test_name = 0);
import void done_testing();