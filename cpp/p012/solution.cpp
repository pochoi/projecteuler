#include <iostream>
#include <map>

int count_divisor(const int k) {
    int d = 1;
    for(int j=1; j<k; j++) {
        if(k%j == 0) {
            d += 1;
        }
    }
    return d;
}

int main() {
    int ans = 1;

    std::map<int, int> m;
    for(int k = 1; k<10000; k++) {
        if(m.find(k) == m.end()){
            m[k] = count_divisor(k);
        }
        if(m.find(2*k+1) == m.end()){
            m[2*k+1] = count_divisor(2*k+1);
        }
        if(m.find(2*k-1) == m.end()){
            m[2*k-1] = count_divisor(2*k-1);
        }
        if(m[k]*m[2*k-1] > 500) {
            ans = k*(2*k-1);
            break;
        }
        if(m[k]*m[2*k+1] > 500) {
            ans = k*(2*k+1);
            break;
        }
    }
    
    std::cout << "The answer is: " << ans << std::endl;

    return 0;
}