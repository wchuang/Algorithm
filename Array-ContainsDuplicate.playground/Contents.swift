/*
 给定一个整数数组，判断是否存在重复元素。
 如果任意一值在数组中出现至少两次，函数返回 true 。如果数组中每个元素都不相同，则返回 false。
 */
func containsDuplicate(_ nums: [Int]) -> Bool {
    guard !nums.isEmpty else { return false }
    var cache = [Int: Int]()
    for num in nums {
        if var count = cache[num] {
            count += 1
            cache[num] = count
            if count >= 2 {
                return true
            }
        } else {
            cache[num] = 1
        }
    }
    return false
}

containsDuplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2])
containsDuplicate([1, 2, 3, 5])
