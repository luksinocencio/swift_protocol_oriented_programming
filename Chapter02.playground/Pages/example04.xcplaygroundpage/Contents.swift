import Foundation

// Protocol Inheritance

protocol BinaryRepresantable {
    var tag: String { get }
    var data: Data { get }
    init(tag: String, data: Data)
}

protocol BinaryPersistable: BinaryRepresantable, CustomStringConvertible, Equatable {
    init(tag: String, contentsOfUrl: URL) throws
    func persist(to url: URL) throws
}

protocol Base64Encodable: BinaryRepresantable {
    var base64: String { get }
}


