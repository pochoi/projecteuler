#include <iostream>

int main() {
    const int N = 100;

    //(a + b + c)^2 - (a^2 + b^2 + c^2)
    //(a+b)^2 + 2(a+b)c + c^2 - (a^2 + b^2 + c^2)
    //(a+b)^2 - (a^2 + b^2) + 2(a+b)c

    int ans = 4;
    int s = 3;
    for(int i=3; i<=N; i++) {
        ans += 2*s*i;
        s += i;
    }

    std::cout << "The answer is: " << ans << std::endl;
    return(0);
}