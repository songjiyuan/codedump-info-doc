#include <string>
#include <iostream>
#include "a.h"

using namespace std;

namespace {
struct Info {
  string file;
  int value;
};
};

void a_test() {
  cout << "in a_test" << endl;
  Info info;
  info.file = "file";
  info.value = 1;
}
