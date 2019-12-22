// new module header
#define NO_PLAN -1
#define SKIP_ALL -2
#define DEFAULT_TEST_FILENAME "agstest.log"

struct tap{
  import static void clean_test();
  import static void plan(int n,  String skip_reason = 0);
  import static void ok(bool condition, String test_name = 0);
  import static void nok(bool condition, String test_name = 0);
  import static void is(String got,  String expected, String test_name = 0);
  import static void isnt(String got,  String expected, String test_name = 0);
  import static void is_int(int got,  int expected, String test_name = 0);
  import static void isnt_int(int got,  int expected, String test_name = 0);
  import static void is_float(float got,  float expected, float epsilon, String test_name = 0);
  import static void isnt_float(float got,  float expected, float epsilon, String test_name = 0);
  import static void done_testing();
  import static void Harness();
};