/*
实现一种算法，找出单向链表中倒数第 k 个节点。返回该节点的值。

注意：本题相对原题稍作改动

示例：

输入： 1->2->3->4->5 和 k = 2
输出： 4

说明：

给定的 k 保证是有效的。
*/

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func kthToLast(_ head: ListNode?, _ k: Int) -> Int {
    var fast = head
    var slow = head
    var num = 0

    while fast != nil {
        if num >= k {
            slow = slow?.next
        }
        num += 1
        fast = fast?.next
    }

    return slow?.val ?? 0
}

//[1, 2, 3, 4, 5], 2
