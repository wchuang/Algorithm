// 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
func rotate(_ nums: inout [Int], _ k: Int) {
    guard !nums.isEmpty, k > 0 else { return }
    var count = k % nums.count
    while count > 0 {
        let last = nums.removeLast()
        nums.insert(last, at: 0)
        count -= 1
    }
}

var arr = [1, 2, 3, 4, 5, 6, 7]
rotate(&arr, 3)
