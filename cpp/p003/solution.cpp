#include <iostream>
const long int N = 600851475143;

int main() {
    long int r = N;
    long int ans = 2;

    while(ans < r) {
        if(r % ans == 0) {
            r /= ans;
        } else {
            ans += 1;
        }
    }

    std::cout << "The answer is: " << ans << std::endl;
    return(0);
}