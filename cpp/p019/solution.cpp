#include <iostream>


class Date
{
public:
    Date() : year(1900), month(1), day(1), weekday(1) {}
    uint32_t getYear() {return year;}
    uint32_t getMonth() {return month;}
    uint32_t getDay() {return day;}
    uint32_t getWeekday() {return weekday;}

    void next()
    {
        weekday = (weekday+1) % 7;
        const uint32_t maxDay{getDaysInMonth(year, month)};
        if (day < maxDay)
        {
            day += 1;
        }
        else
        {
            if (month < 12)
            {
                month += 1;
            }
            else
            {
                year += 1;
                month = 1;
            }
            day = 1;
        }
    }

    bool isLessThan(const uint32_t y, const uint32_t m, const uint32_t d)
    {
        if (year < y) return true;
        if (year > y) return false;
        if (month < m) return true;
        if (month > m) return false;
        return day < d;
    }

    void setDate(const uint32_t y, const uint32_t m, const uint32_t d)
    {
        while (isLessThan(y, m, d))
        {
            next();
        }
    }

private:
    uint32_t year;
    uint32_t month;
    uint32_t day;
    uint32_t weekday;

    bool isLeapYear(const uint32_t y) const
    {
        return(
            y % 4 == 0 &&
            (y % 100 != 0 || y % 400 == 0));
    }

    uint32_t getDaysInMonth(uint32_t y, uint32_t m) const
    {
        switch (m)
        {
            case 1: case 3: case 5: case 7: case 8: case 10: case 12:
                return 31;
            case 4: case 6: case 9: case 11:
                return 30;
            case 2:
                return isLeapYear(y) ? 29 : 28;
            default:
                return 0; // Invalid month
        }
    }
};



int main()
{
    uint32_t count{0U};
    Date date{};
    date.setDate(1900,12,31);
    while(date.isLessThan(2000,12,31))
    {
        date.next();
        if (date.getDay() == 1 && date.getWeekday() == 0)
        {
            count += 1;
        }
    }

    std::cout << "The answer is " << count << std::endl;

    return 0;
}