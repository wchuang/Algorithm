
// 给定一个 haystack 字符串和一个 needle 字符串，
// 在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。
// 如果不存在，则返回  -1。

import Foundation

func strStr(_ haystack: String, _ needle: String) -> Int {
    guard !needle.isEmpty else { return 0 }
    guard !haystack.isEmpty else { return -1 }
    let target: NSString = haystack as NSString
    for (index, char) in haystack.enumerated() {
        if char == needle.first {
            if index + needle.count > haystack.count {
                return -1
            }
            let range = NSRange(location: index, length: needle.count)
            if target.substring(with: range) == needle {
                return index
            }
        }
    }
    return -1
}

strStr("aaa", "aaaa")
