import Foundation

// 二分搜尋（遞迴）
func binarySearchRecursion(_ array: [Int], target: Int) -> Int? {

    func search(left: Int, right: Int) -> Int? {
        guard left >= 0, right < array.count, left <= right else { return nil }
        let middle = left + ((right - left) >> 1)
        let value = array[middle]
        if value > target {
            return search(left: left, right: middle - 1)
        } else if value < target {
            return search(left: middle + 1, right: right)
        } else {
            return value
        }
    }

    guard !array.isEmpty else { return nil }
    return search(left: 0, right: array.count - 1)
}

binarySearchRecursion([1, 2, 3, 4, 6, 10, 100, 99, 999, 1000, 2323, 3333, 4444, 5555, 6666, 9999], target: 1)

// 二分搜尋（遍歷）
func binarySearchTraversal(_ array: [Int], target: Int) -> Int? {
    guard !array.isEmpty else { return nil }
    var left = 0
    var right = array.count - 1
    while left <= right {
        let middle = left + ((right - left) >> 1)
        let value = array[middle]
        if value > target {
            right = middle - 1
        } else if value < target {
            left = middle + 1
        } else {
            return value
        }
    }
    return nil
}

binarySearchTraversal([1, 2, 3, 4, 6, 10, 100, 99, 999, 1000, 2323, 3333, 4444, 5555, 6666, 9999], target: 1)
