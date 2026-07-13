class Solution {
public:
    int searchInsert(vector<int>& nums, int target)
    {
        int lower = 0, upper = nums.size() - 1, mid;

        if(target > nums[nums.size() - 1]) return nums.size();
        if(target < nums[0]) return 0;

        while(lower <= upper)
        {
            mid = lower + (upper - lower) / 2;

            if (target == nums[mid])
            {
                return mid;
            }
            else if (target > nums[mid])
            {
                lower = mid + 1;
            }
            else if (target < nums[mid])
            {
                upper = mid - 1;
            }
        }
    return upper + 1;
    }
};