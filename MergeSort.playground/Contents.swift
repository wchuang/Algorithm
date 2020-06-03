import Foundation

func mergeSort(_ array: inout [Int], start: Int, end: Int) {
    guard !array.isEmpty, start >= 0, end < array.count, start < end else { return }
    let middle = start + ((end - start) >> 1)
    mergeSort(&array, start: start, end: middle)
    mergeSort(&array, start: middle + 1, end: end)
    mergeSorting(&array, start: start, end: end, middle: middle)
}

func mergeSorting(_ array: inout [Int], start: Int, end: Int, middle: Int) {
    var leftArray = array[start...middle]
    var rightArray = array[(middle + 1)...end]
    var leftIndex = start
    var rightIndex = middle + 1
    var index = start

    leftArray.append(Int.max)
    rightArray.append(Int.max)

    while index <= end {
        let left = leftArray[leftIndex]
        let right = rightArray[rightIndex]
        if left <= right {
            array[index] = left
            leftIndex += 1
        } else {
            array[index] = right
            rightIndex += 1
        }
        index += 1
    }
}

var array = [5, 3, 8, 6, 2, 7, 1, 4]
mergeSort(&array, start: 0, end: array.count - 1)
