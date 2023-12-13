#include <iostream>

int main() {
    const int MAX_TERM = 4000000;

    int a = 1;
    int b = 2;
    int c = a + b;
    int ans = 2;

    while(c <= MAX_TERM) {
        a = b;
        b = c;
        c = a + b;
        if( c % 2 == 0) {
            ans += c;
        }
    };
    std::cout << "The answer is: " << ans << std::endl;
    return(0);
}