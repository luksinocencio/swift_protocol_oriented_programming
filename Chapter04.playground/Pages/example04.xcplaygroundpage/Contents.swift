import Foundation

// Placeholder types in protocols

//protocol TaggedData {
//    var tag: String { get }
//    var data: Data { get }
//    init(tag: String, data: Data)
//}

protocol TaggedContent {
    associatedtype Content
    
    var tag: String { get }
    var data: Content { get }
    init(tag: String, data: Content)
}

struct TaggedDouble: TaggedContent {
    var tag: String
    var data: Date
}

