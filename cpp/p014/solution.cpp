#include <iostream>
#include <unordered_map>

uint64_t next(uint64_t n)
{
    if (n % 2 == 0)
    {
        n /= 2;
    }
    else
    {
        n *= 3;
        n += 1;
    }

    return n;
}

uint64_t length(
    std::unordered_map<uint64_t, uint64_t>& computedLen,
    const uint64_t n)
{
    if (n == 1U)
    {
        return 1U;
    }

    if (computedLen.find(n) != computedLen.end())
    {
        return computedLen[n];
    }

    const uint64_t nextLen{length(computedLen, next(n))};

    computedLen[n] = nextLen + 1U;
    return nextLen + 1U;
}


int main()
{
    uint64_t maxLen{1U};
    uint64_t maxN{1U};
    std::unordered_map<uint64_t, uint64_t> computedLen;

    for (uint64_t i{1U}; i < 1000000; ++i)
    {
        const uint64_t len{length(computedLen, i)};
        if (len > maxLen)
        {
            maxLen = len;
            maxN = i;
        }
    }
    std::cout << "The answer is " << maxN << std::endl;

    return 0;
}
