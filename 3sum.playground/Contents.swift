func findTargetSum(_ nums: [Int], target: Int) -> [[Int]] {
    var results = Set<[Int]>()

    if nums.count <= 2 { return Array(results) }

    let sortedNums = nums.sorted()
    var index = 0

    print("\(sortedNums)")

    while index < sortedNums.count - 2 {

        var low = index + 1
        var high = sortedNums.count - 1

        while low < high {

            let sum = sortedNums[index] + sortedNums[low] + sortedNums[high]

            if sum == target {
                results.insert([sortedNums[index], sortedNums[low], sortedNums[high]])
            }

            if sum > target {
                repeat {
                    high -= 1
                } while low < high && sortedNums[high] == sortedNums[high + 1]
            } else {
                repeat {
                    low += 1
                } while low < high && sortedNums[low] == sortedNums[low - 1]
            }
        }

        index += 1
    }

    return Array(results)
}

let nums = [-1, 0, 1, 2, -1, -4]
let results = findTargetSum(nums, target: 0)
print("\(results)")

// [[-1, -1, 2], [-1, 0, 1]]
