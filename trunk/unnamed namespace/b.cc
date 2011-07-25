#include <string>
#include <iostream>
#include "b.h"

using namespace std;

struct Info {
  string src_file;
  string dst_file;
  string unzip_dir;
  int value;
};

void b_test() {
  std::cout << "in b_test" << endl;
  cout << "sizeof(Info): " << sizeof(Info) << endl;
  Info info;
  info.src_file = "src_file";
  info.dst_file = "dst_file";
  info.unzip_dir = "unzip_dir";
  info.value = 1;
  cout << "out b_test" << endl;
}
