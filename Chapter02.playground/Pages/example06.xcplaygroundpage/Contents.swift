import Foundation

// Protocol Composition

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

struct MyData {
    var tag: String
    var data: Data
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
}

extension MyData: BinaryPersistable {
    init(tag: String, contentsOfUrl: URL) throws {
        let data = try Data.init(contentsOf: contentsOfUrl)
        self.init(tag: tag, data: data)
    }
    
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
}

extension MyData: CustomStringConvertible {
    var description: String {
        return "MyData(\(tag)"
    }
}

extension MyData: Base64Encodable {
    var base64: String {
        return self.data.base64EncodedString()
    }
}

