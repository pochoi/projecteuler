#include <iostream>
#include <unordered_set>

class AmicableNumber
{
public:
    uint64_t getDivisorSum(const uint64_t n)
    {
        uint64_t s{1U};

        const uint64_t sqrtN{sqrt(n)};
        for (uint64_t i{2U}; i < sqrtN; ++i)
        {
            if (n%i == 0)
            {
                s += i;
                if ( i*i != n )
                {
                    s += n/i;
                }
            }
        }
        return s;
    }

    uint64_t sumAmicable(const uint64_t n)
    {
        std::unordered_set<uint64_t> seenAmicable;
        uint64_t s{0U};
        for (uint64_t i{2U}; i < n; ++i)
        {
            if (seenAmicable.find(i) != seenAmicable.end())
            {
                continue;
            }
            const uint64_t j{getDivisorSum(i)};
            if (j==i)
            {
                continue;
            }
            const uint64_t k{getDivisorSum(j)};
            if (i==k)
            {
                s += i + j;
                seenAmicable.insert(i);
                seenAmicable.insert(j);
                std::cout << "Amicable pair = (" << i << "," << j << ")" << std::endl;
            }
        }
        return s;
    }

private:
    uint64_t sqrt(const uint64_t n)
    {
        if (n == 0U)
        {
            return 0U;
        }

        uint64_t x{n};
        uint64_t x1{(x+n/x)/2};

        while (x1 < x)
        {
            x  = x1;
            x1 = (x+n/x)/2;
        }

        return x;
    }
};


int main()
{
    AmicableNumber a{AmicableNumber()};
    std::cout << "The answer is " << a.sumAmicable(10000U) << std::endl;

    return 0;
}