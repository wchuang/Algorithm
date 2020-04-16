/*
翻转一棵二叉树。

示例：

输入：

      4
    /   \
   2     7
    / \   / \
   1   3 6   9

输出：

  4
/   \
7     2
/ \   / \
9   6 3   1

*/

// Definition for a binary tree node.

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        if root.left == nil && root.right == nil {
            return root
        }
        let leftNode = invertTree(root.left)
        let rightNode = invertTree(root.right)
        root.right = leftNode
        root.left = rightNode
        return root
    }
}
