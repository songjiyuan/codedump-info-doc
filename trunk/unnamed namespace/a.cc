#include <string>
#include <iostream>
#include "a.h"

using namespace std;

struct Info {
  string file;
  int value;
};

void a_test() {
  cout << "in a_test" << endl;
  cout << "sizeof(Info): " << sizeof(Info) << endl;
  Info info;
  info.file = "file";
  info.value = 1;
  cout << "out a_test" << endl;
}
