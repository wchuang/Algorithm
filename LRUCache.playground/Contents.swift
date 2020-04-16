/*
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。

获取数据 get(key) - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
写入数据 put(key, value) - 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。

进阶:

你是否可以在 O(1) 时间复杂度内完成这两种操作？

示例:

LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );

cache.put(1, 1);
cache.put(2, 2);
cache.get(1);       // 返回  1
cache.put(3, 3);    // 该操作会使得密钥 2 作废
cache.get(2);       // 返回 -1 (未找到)
cache.put(4, 4);    // 该操作会使得密钥 1 作废
cache.get(1);       // 返回 -1 (未找到)
cache.get(3);       // 返回  3
cache.get(4);       // 返回  4
*/

class LRUCache {

    class Node {
        var prev: LRUCache.Node?
        var next: LRUCache.Node?
        let key: Int
        let value: Int
        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }

    private let _capacity: Int
    private var _hash: [Int: Node]
    private var _head = Node(key: 0, value: 0)
    private var _tail = Node(key: 0, value: 0)

    init(_ capacity: Int) {
        _capacity = capacity
        _hash = [:]
        _head.next = _tail
        _tail.prev = _head
    }

    func get(_ key: Int) -> Int {
        guard let node = _hash[key] else { return -1 }
        _deleteNode(node)
        _insertTailNode(node)
        return node.value
    }

    func put(_ key: Int, _ value: Int) {
        let node = Node(key: key, value: value)
        if let oldNode = _hash[key] {
            _deleteNode(oldNode)
            _insertTailNode(node)
        } else {
            if _hash.count == _capacity {
                guard let head = _deleteHeadNode() else {
                    return
                }
                _hash.removeValue(forKey: head.key)
            }
            _insertTailNode(node)
        }
        _hash[key] = node
    }

    private func _deleteNode(_ node: Node) {
        node.next?.prev = node.prev
        node.prev?.next = node.next
        node.next = nil
        node.prev = nil
    }

    private func _insertTailNode(_ node: Node) {
        let head = _tail.prev
        head?.next = node
        node.prev = head
        node.next = _tail
        _tail.prev = node
    }

    private func _deleteHeadNode() -> Node? {
        guard let shouldDelete = _head.next else {
            return nil
        }
        _deleteNode(shouldDelete)
        return shouldDelete
    }
}

let cache = LRUCache(2)

cache.put(1, 1);
cache.put(2, 2);
cache.get(1);       // 返回  1
cache.put(3, 3);    // 该操作会使得密钥 2 作废
cache.get(2);       // 返回 -1 (未找到)
cache.put(4, 4);    // 该操作会使得密钥 1 作废
cache.get(1);       // 返回 -1 (未找到)
cache.get(3);       // 返回  3
cache.get(4);       // 返回  4

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
