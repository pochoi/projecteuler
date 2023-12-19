#include <iostream>

const int N = 10001;

int main(){
    unsigned long int prime[N] = {0};
    prime[0] = 2;
    prime[1] = 3;
    prime[2] = 5;
    prime[3] = 7;
    prime[4] = 11;
    prime[5] = 13;
    prime[6] = 17;
    prime[7] = 19;
    prime[8] = 23;
    int prime_length = 9;

    unsigned long int current_number = 24;
    while( prime_length < N ) {
        bool is_prime = true;
        for(int i=0; i<prime_length; i++) {
            if(current_number % prime[i] == 0) {
                is_prime = false; 
                break;
            }
        }
        if(is_prime) {
            prime[prime_length] = current_number;
            prime_length++;
        }
        current_number++;
    }

    std::cout << "The answer is: " << prime[N-1] << std::endl;

    return(0);
}