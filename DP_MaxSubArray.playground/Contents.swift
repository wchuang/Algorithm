
func maxSubArray(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    var preSum = 0
    var max = nums[0]
    for value in nums {
        if value + preSum > value {
            preSum = value + preSum
        } else {
            preSum = value
        }
        if max < preSum {
            max = preSum
        }
    }
    return max
}

var arr = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
maxSubArray(arr)
