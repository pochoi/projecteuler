#include <iostream>
#include <string>
#include <vector>

class NumberEnglish
{
public:
    std::string number2Words(uint32_t number)
    {
        if (number == 0U)
        {
            return "zero";
        }
        if (number >= 1000)
        {
            return "onethousand";
        }

        std::string words;

        if (number >= 100)
        {
            const uint32_t hundreds = number / 100;
            words += units[hundreds] + "hundred";
            if (number % 100 != 0) {
                words += "and";
            }
            number %= 100;
        }

        if (number >= 20)
        {
            uint32_t t = number / 10;
            words += tens[t];
            number %= 10;
        }
        else if (number >= 10)
        {
            words += teens[number - 10];
            number = 0;
        }

        if (number > 0) {
            words += units[number];
        }

        return words;
    }

private:
    const std::vector<std::string> units{
        {"", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"}
    };
    const std::vector<std::string> teens{
        {"ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen",
         "sixteen", "seventeen", "eighteen", "nineteen"}
    };
    const std::vector<std::string> tens{
        {"", "", "twenty", "thirty", "forty", "fifty",
        "sixty", "seventy", "eighty", "ninety"}
    };
};


int main()
{
    NumberEnglish ne = NumberEnglish();

    uint32_t ans{0U};
    for (uint32_t i{1U}; i<=1000; ++i)
    {
        ans += ne.number2Words(i).size();
    }

    std::cout << "The answer is " << ans << std::endl;

    return 0;
}

