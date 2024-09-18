#include "hello.h"
#include <iostream>

int main(int argc, char const *argv[]) {
  std::string const name = argc >= 2 ? argv[1] : "";
  auto const output = hello(name);
  if (!output.empty()) {
    std::cout << output << '\n';
  }
  return 0;
}
