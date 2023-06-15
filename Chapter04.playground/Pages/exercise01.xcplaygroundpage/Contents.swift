import Foundation

public protocol StackProtocol {
    associatedtype E
    
    mutating func push(_ item: E)
    mutating func pop() -> E?
    mutating func peek() -> E?
    
    var count: Int { get }
    var isEmpty: Bool { get }
}

public struct Stack<T>: StackProtocol {
    private var storage = [T]()
    
    public var count: Int {
        storage.count
    }
    public var isEmpty: Bool  {
        storage.isEmpty
    }
    
    mutating public func push(_ item: T) {
        storage.append(item)
    }
    
    mutating public func pop() -> T? {
        storage.popLast()
    }
    
    mutating public func peek() -> T? {
        storage.last
    }
}

var stringStack = Stack<String>()
stringStack.push("Hello")
stringStack.push(", ")
stringStack.push("Swift")

print(stringStack.pop() ?? "empty")
print(stringStack.pop() ?? "empty")
print(stringStack.peek() ?? "empty")
print(stringStack.count)
