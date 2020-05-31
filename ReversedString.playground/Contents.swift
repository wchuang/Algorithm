// 反轉字符串
func reverseString(_ s: inout [Character]) {
    guard !s.isEmpty else {
        return
    }
    var min = 0
    var max = s.count - 1
    while min < max {
        let temp = s[min]
        s[min] = s[max]
        s[max] = temp
        min += 1
        max -= 1
    }
}
