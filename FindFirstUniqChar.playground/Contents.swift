// 字符串中的第一個唯一字符
func firstUniqChar(_ s: String) -> Int {
    guard !s.isEmpty else { return -1 }
    var hash = [Character: Int]()
    for char in s {
        if var count = hash[char] {
            count += 1
            hash[char] = count
        } else {
            hash[char] = 1
        }
    }
    for (index, char) in s.enumerated() {
        if 1 == hash[char] {
            return index
        }
    }
    return -1
}
