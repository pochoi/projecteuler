#include <iostream>
#include <vector>
#include <numeric>

class BigInt
{
public:
    BigInt(const size_t n)
    {
        digits.reserve(n);
        digits.push_back(1U);
    }

    void m2()
    {
        uint32_t carry{0U};
        for (auto& digit : digits)
        {
            const uint32_t s{digit*2U + carry};
            carry = s / 10U;
            digit = s % 10U;
        }

        if (carry > 0U)
        {
            digits.push_back(carry);
        }
    }

    uint64_t sum()
    {
        uint64_t s{0U};
        for (const auto& digit : digits)
        {
            s += digit;
        }
        return s;
    }

private:
    std::vector<uint32_t> digits;
};

int main()
{
    BigInt d{BigInt(500U)};
    for (size_t i{0U}; i < 1000U; ++i)
    {
        d.m2();
    }

    std::cout << "The answer is " << d.sum() << std::endl;

    return 0;
}