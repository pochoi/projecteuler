#include <iostream>
#include <vector>

class BigInt
{
public:
    BigInt(const size_t n)
        : factor(0U)
    {
        digits.reserve(3*n);
        digits.push_back(1U);
    }

    void next()
    {
        factor += 1;
        uint32_t carry{0U};
        for (auto& digit : digits)
        {
            const uint32_t s{digit*factor + carry};
            carry = s / 10U;
            digit = s % 10U;
        }

        while (carry > 0U)
        {
            digits.push_back(carry % 10U);
            carry /= 10U;
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

    uint32_t getFactor()
    {
        return factor;
    }

private:
    uint32_t factor;
    std::vector<uint32_t> digits;
};


int main()
{
    BigInt b{BigInt(100)};
    for (uint32_t i{0U}; i < 100U; ++i)
    {
        b.next();
    }

    std::cout << "The answer is " << b.sum() << std::endl;

    return 0;
}