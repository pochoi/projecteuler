#include <iostream>
#include <fstream>
#include <string>
#include <vector>

int main()
{
    std::ifstream file("p013/data.txt");
    if(!file.is_open())
    {
        std::cerr << "Error: cannot open data.txt" << std::endl;
        return 1;
    }

    std::vector<std::string> numbers;
    std::string number;
    while (file >> number)
    {
        numbers.push_back(number);
    }

    std::string ans{""};
    uint32_t carry{0U};
    for (int i{49}; i >= 0; --i)
    {
        uint32_t colSum{carry};
        for (const auto& number : numbers)
        {
            colSum += number[i] - '0';
        }

        carry = colSum / 10U;
        ans = std::to_string(colSum % 10U) + ans;
    }

    while (carry > 0U)
    {
        ans = std::to_string(carry % 10U) + ans;
        carry /= 10U;
    }

    std::cout << "The answer is: " << ans.substr(0, 10) << std::endl;

    return 0;
}

