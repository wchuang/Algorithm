// 给定两个数组，编写一个函数来计算它们的交集。
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    guard !nums1.isEmpty, !nums2.isEmpty else { return [] }
    var cache = [Int: Int]() // key: 目标数, value: 较小数组重复次数
    let minNums = nums1.count > nums2.count ? nums2 : nums1
    let maxNums = nums1.count > nums2.count ? nums1 : nums2
    for num in minNums {
        if var count = cache[num] {
            count += 1
            cache[num] = count
        } else {
            cache[num] = 1
        }
    }
    var results = [Int]()
    for num in maxNums {
        if var count = cache[num], count > 0 {
            count -= 1
            cache[num] = count
            results.append(num)
        }
    }
    return results
}

intersect([1, 2, 2, 1], [2, 2])
intersect([4, 9, 5], [9, 4, 9, 8, 4])
