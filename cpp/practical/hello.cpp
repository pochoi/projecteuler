/********************************************************
 * hello -- programe to rpint out "Hello WOrld".        *
 *      Not an especially earth-shattering programe.    *
 * Author: Chi Po Choi                                  *
 * Purpose: Demonstration of a simple program           *
 * Usage:                                               *
 *      Rune the programe and the message appears       *
 *                                                      *
 ********************************************************/

#include <iostream>

int main()
{
    int a;
    int b;
    // Tell the world hello
    std::cout << "Hello World\n";
    std::cin >> a >> b;
    std::cout << "The values of a and b are " << a << " and " << b << ".\n";
    return (0);
}