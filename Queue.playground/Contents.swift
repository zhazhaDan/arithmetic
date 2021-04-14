import UIKit

public struct ArrayQueue<T> {
    fileprivate var array = [T]()


    public init<S: Sequence>(_ elements: S) where S.Iterator.Element == T {
        array.append(contentsOf: elements)
    }

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count
    }

    public mutating func enqueue(_ element: T?) {
        guard let ele = element else {
            return
        }
        array.append(ele)
    }

    public mutating func dequeue() -> T? {
        if isEmpty { return nil }
        return array.removeFirst()
    }

    public mutating func front() -> T? {
        return array.first
    }
}

extension ArrayQueue: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }

}

extension ArrayQueue: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return array.description
    }

    public var debugDescription: String {
        return array.debugDescription
    }
}
//var queue = ArrayQueue<String>()
//queue.enqueue("G")
//queue.enqueue("D")
//queue.enqueue("D")
var queue: ArrayQueue = ["G", "D", "D"]

print(queue)
