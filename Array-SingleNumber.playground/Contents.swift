/*
 题目：只出现一次的数字。
 XOR运算：
 任何数和 000 做异或运算，结果仍然是原来的数，即 a⊕0=aa \oplus 0=aa⊕0=a。
 任何数和其自身做异或运算，结果是 000，即 a⊕a=0a \oplus a=0a⊕a=0。
 异或运算满足交换律和结合律，即 a⊕b⊕a=b⊕a⊕a=b⊕(a⊕a)=b⊕0=ba \oplus b \oplus a=b \oplus a \oplus a=b \oplus (a \oplus a)=b \oplus0=ba⊕b⊕a=b⊕a⊕a=b⊕(a⊕a)=b⊕0=b。
 */

// Solution 1（但是空间复杂度为 N）
func singleNumber(_ nums: [Int]) -> Int {
    var cache = [Int: Int]()
    for num in nums {
        if var count = cache[num] {
            count += 1
            cache[num] = count
        } else {
            cache[num] = 1
        }
    }
    for (key, value) in cache {
        if value == 1 {
            return key
        }
    }
    return 0
}

// Solution 2（空间复杂度为 1）
func singleNumber2(_ nums: [Int]) -> Int {
    var result = 0
    for num in nums {
        result ^= num
    }
    return result
}

singleNumber([1, 2, 1, 2, 4])
singleNumber2([1, 2, 1, 2, 4])
