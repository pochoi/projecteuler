#include <iostream>

const int MAX_SIZE  =  200000;
const int MAX_VALUE = 2000000;

int main() {
    int primes[MAX_SIZE];
    primes[0] = 2;
    primes[1] = 3;
    primes[2] = 5;
    primes[3] = 7;
    primes[4] = 11;

    unsigned long long ans = 2+3+5+7+11;
    
    int primes_size = 5;
    for(int i=13; i<MAX_VALUE; i++) {
        bool is_prime = true;
        for(int j=0; j<primes_size && primes[j]*primes[j] <= i; j++) {
            if(i%primes[j]==0) {
                is_prime = false;
                break;
            }
        }
        if(is_prime) {
            ans += i;
            primes[primes_size++] = i;
        }
    }

    std::cout << "The answer is: " << ans << std::endl;
    return(0);
}