#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>

class TrianglePathSum
{
public:
    std::vector<std::vector<uint32_t>> buildTriangle(const std::string& path)
    {
        std::vector<std::vector<uint32_t>> rows{};
        std::ifstream file(path);
        if (!file.is_open())
        {
            std::cerr << "Cannot open " << path << std::endl;
            return rows;
        }

        std::string line;
        while (std::getline(file, line))
        {
            std::stringstream ss(line);
            std::vector<uint32_t> row;
            int num;
            while (ss >> num) {
                row.push_back(num);
            }
            rows.push_back(row);
        }
        return rows;
    }

    TrianglePathSum(const std::string& path)
        : triangle{buildTriangle(path)}
    {
        for (const auto& row : triangle)
        {
            triangleMaxPathSum.push_back(
                std::vector<uint32_t>(row.size(), 0U));
        }
    }

    uint32_t maxPathSum(const uint32_t row, const uint32_t col)
    {
        if (row == triangle.size() - 1)
        {
            return triangle[row][col];
        }
        if (triangleMaxPathSum[row][col] > 0)
        {
            return triangleMaxPathSum[row][col];
        }

        const uint32_t leftMaxPathSum{maxPathSum(row + 1, col)};
        const uint32_t rightMaxPathSum{maxPathSum(row + 1, col + 1)};

        if (leftMaxPathSum > rightMaxPathSum)
        {
            triangleMaxPathSum[row][col] = triangle[row][col] + leftMaxPathSum;
        }
        else
        {
            triangleMaxPathSum[row][col] = triangle[row][col] + rightMaxPathSum;
        }

        return triangleMaxPathSum[row][col];
    }

    uint32_t getSize()
    {
        return triangle.size();
    }

private:
    const std::vector<std::vector<uint32_t>> triangle;
    std::vector<std::vector<uint32_t>> triangleMaxPathSum;

};

int main()
{
    TrianglePathSum tree{TrianglePathSum("./p067/triangle.txt")};
    std::cout << "The answer is " << tree.maxPathSum(0, 0) << std::endl;

    return 0;
}