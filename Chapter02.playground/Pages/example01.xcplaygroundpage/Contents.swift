import Foundation

// Create protocol
// Create variables and use on struct

protocol BinaryRepresentable {
    var tag: String { get set }
    var data: Data { get }
    static var counter: Int { get }

    init(tag: String, data: Data)
    
    mutating func update(data: Data) -> Bool
    static func incrementCounter()
}

struct TaggedData: BinaryRepresentable {
    var tag: String
    var data: Data
    static var counter: Int = 0

    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }

    mutating func update(data: Data) -> Bool {
        self.data = data
        return true
    }

    static func incrementCounter() {
        counter += 1
    }
}
