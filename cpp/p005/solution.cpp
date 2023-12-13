#include <iostream>

int gcd(const int a, const int b) {
    if(a == 0) {
        return(b);
    }
    if(b == 0) {
        return(a);
    }
    if(a >= b) {
        return(gcd(b, a % b));
    } else {
        return(gcd(a, b % a));
    }
}

int main() {
    const int N = 20;
    int ans = 1;

    for(int i = 2; i <= N; i++) {
        ans *= (i / gcd(ans, i));
    }
    std::cout << "The answer is: " << ans << std::endl;
    return(0);
}