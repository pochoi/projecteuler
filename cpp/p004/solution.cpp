#include <iostream>

int reverse(int n) {
    int reversed_n = 0;
    while(n > 0) {
        reversed_n *= 10;
        reversed_n += n % 10;
        n = (n - (n % 10)) / 10;
    }
    return(reversed_n);
}

bool check_palindrome(int n) {
    return(n == reverse(n));
}

int main() {
    int ans = 0;
    for(int i=100; i<1000; i++) {
        for(int j=i+1; j<1000; j++) {
            int p = i*j;
            if(check_palindrome(p) && p > ans) {
                ans = p;
            }
        }
    }
    std::cout << "The answer is: " << ans << std::endl;
    return(0);
}