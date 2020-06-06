/*
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

 示例:

 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]

 说明:

 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。
 */
func moveZeroes(_ nums: inout [Int]) {
    guard !nums.isEmpty else { return }
    var firstZero = -1
    var index = 0
    while index < nums.count {
        let num = nums[index]
        if num == 0 {
            if firstZero == -1 {
                firstZero = index
            }
        } else if firstZero > -1 {
            nums[firstZero] = num
            nums[index] = 0
            firstZero += 1
        }
        index += 1
    }
}

var arr = [0, 1, 0, 3, 12]
moveZeroes(&arr)
arr = [1]
moveZeroes(&arr)
