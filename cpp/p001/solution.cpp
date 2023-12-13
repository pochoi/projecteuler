#include <iostream>

int main() {
    int ans = 0;
    const int N = 1000;

    for(int i=1; i<N; i++) {
        if(i % 3 == 0 || i % 5 == 0) {
            ans += i;
        }
    }
    std::cout << "The answer is: " << ans << std::endl;

    return(0);
}
