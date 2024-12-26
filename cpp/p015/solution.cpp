#include <iostream>
#include <vector>

class LatticePaths
{
public:
    LatticePaths(const uint64_t width, const uint64_t height)
        : m_width(width)
        , m_height(height)
    {
        counts.resize(m_height);
        for (auto &row : counts)
        {
            row.resize(m_width, 0U);
        }
        if (m_width > 0U && m_height > 0U)
        {
            counts[0][0] = 1U;
        }
    }

    uint64_t countPaths(const uint64_t w, const uint64_t h)
    {
        if (w >= m_width || h >= m_height)
        {
            return 0U;
        }

        uint64_t& count{counts[h][w]};

        if (count > 0U)
        {
            return count;
        }

        if (h > 0)
        {
            count += countPaths(w, h - 1U);
        }

        if (w > 0)
        {
            count += countPaths(w - 1U, h);
        }

        return count;
    }

private:
    const uint64_t m_width;
    const uint64_t m_height;
    std::vector<std::vector<uint64_t>> counts;
};

int main()
{
    const uint64_t WIDTH{20U};
    const uint64_t HEIGHT{20U};

    LatticePaths lp{LatticePaths(WIDTH+1U, HEIGHT+1U)};

    const uint64_t ans{lp.countPaths(WIDTH, HEIGHT)};

    std::cout << "The answer is " << ans << std::endl;

    return 0;
}