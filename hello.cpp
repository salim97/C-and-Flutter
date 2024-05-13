#include <iostream>
#include <string>

extern "C" const char* helloWorld() {
    return "<html><p>Hello World!</p></html>";
}

int main() {
    std::cout << helloWorld() << std::endl;
    return 0;
}
