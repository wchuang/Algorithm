/*
两数相乘

999999999*88888888

input: 2数字字符串
output: string
*/
import Foundation

func multi(a: String, b: String) -> String {

    // If have zero value then return zero directly.
    if a == "0" || b == "0" {
        return "0"
    }

    // Vars
    var result = Array<Int>(repeating: 0, count: a.count + b.count)
    let aString: NSString = a as NSString
    let bString: NSString = b as NSString
    var aIndex = a.count - 1
    var bIndex = b.count - 1

    while aIndex >= 0 {

        // Get substring of a and transfer to Int.
        let subA = aString.substring(with: NSRange(location: aIndex, length: 1))
        print("a: \(subA)")
        guard let subAInt = Int(subA) else {
            fatalError("Cannot transfer a'substring to int")
        }

        while bIndex >= 0 {

            // Get substring of b and transfer to Int.
            let subB = bString.substring(with: NSRange(location: bIndex, length: 1))
            print("b: \(subB)")
            guard let subBInt = Int(subB) else {
                fatalError("Cannot transfer b'substring to int")
            }

            // Calculate and allocate
            let index = aIndex + bIndex
            let partSum = subAInt * subBInt + result[index + 1]
            result[index + 1] = partSum % 10
            result[index] += partSum / 10

            bIndex -= 1
        }

        bIndex = b.count - 1
        aIndex -= 1
    }

    print("result: \(result)")
    return result.map{"\($0)"}.joined()
}

let result = multi(a: "999999999", b: "88888888")
let result2 = multi(a: "123", b: "456")
print("result: \(result)")
print("result: \(result2)")
