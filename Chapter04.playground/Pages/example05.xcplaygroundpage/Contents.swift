import Foundation

// Using generics with protocols

protocol Taggable {
    associatedtype Content: Equatable
    var tag: String { get }
    var data: Content { get }
    init(tag: String, data: Content)
}

struct TaggedDouble: Taggable {
    var tag: String
    var data: Double
    
    init(tag: String, data: Double) {
        self.tag = tag
        self.data = data
    }
}

struct TaggedDate: Taggable {
    var tag: String
    var data: Date
    
    init(tag: String, data: Date) {
        self.tag = tag
        self.data = data
    }
}


struct GenericTagged<T: Equatable>: Taggable {
    var tag: String
    var data: T
}

let taggedDouble = GenericTagged(tag: "pi", data: Double.pi)
