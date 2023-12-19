#include <iostream>

/*
a^2+b^2=c^2
a+b+c=1000

c = 1000-a-b
c^2
= (1000-(a+b))^2
= 1000^2 - 2*1000*(a+b) + (a+b)^2

a^2+b^2 = 1000^2 - 2000*(a+b) + (a+b)^2
0 = 1000^2 - 2000*(a+b) + 2*a*b
2000*(a+b) = 1000^2 + 2*a*b 
*/

int main() {
    unsigned long long ans = 0;

    for(int i=1; i<1000; i++) {
        for(int j=1; j<1000-i; j++) {
            if(2000*(i+j) == 1000000 + 2*i*j) {
                ans = i*j*(1000-i-j);
            }
        }
    }

    std::cout << "The answer is: " << ans << std::endl;

    return(0);
}