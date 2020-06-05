import Foundation

func quickSort(_ array: inout [Int], start: Int, end: Int) {
    guard !array.isEmpty, 0 <= start, end < array.count, start < end else { return }
    let middle = quickSorting(&array, start: start, end: end)
    quickSort(&array, start: start, end: middle - 1)
    quickSort(&array, start: middle + 1, end: end)
}

func quickSorting(_ array: inout [Int], start: Int, end: Int) -> Int {
    let comparingValue = array[end]
    var left = start
    var index = start
    while index < end {
        if array[index] <= comparingValue {
            swap(&array, from: index, to: left)
            left += 1
        }
        index += 1
    }
    swap(&array, from: end, to: left)
    return left
}

func swap(_ array: inout [Int], from: Int, to: Int) {
    let temp = array[from]
    array[from] = array[to]
    array[to] = temp
}

var array = [5, 3, 8, 6, 2, 7, 1, 4]
quickSort(&array, start: 0, end: array.count - 1)
