import Foundation

// Protocol - Providing Default Behavior in Protocols

protocol BinaryRepresantable {
    var tag: String { get }
    var data: Data { get }
    init(tag: String, data: Data)
}

extension BinaryRepresantable {
    init(tag: String, contentsOfUrl: URL) throws {
        let data = try Data.init(contentsOf: contentsOfUrl)
        self.init(tag: tag, data: data)
    }
    
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
}

protocol Base64Encodable: BinaryRepresantable {
    var base64: String { get }
}

extension Base64Encodable {
    var base64: String {
        return self.data.base64EncodedString()
    }
}

protocol BinaryPersistable: BinaryRepresantable, CustomStringConvertible, Equatable {
    init(tag: String, contentsOfUrl: URL) throws
    func persist(to url: URL) throws
}

struct MyData {
    var tag: String
    var data: Data
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
}

extension MyData: CustomStringConvertible {
    var description: String {
        return "MyData(\(tag)"
    }
}

extension CustomStringConvertible {
    
}

struct PersistableData: BinaryPersistable {
    var tag: String
    var data: Data
    var description: String {
            return "MyData(\(tag)"
        }
}

let p = PersistableData(tag: "42", data: Data(repeating: 1, count: 10))
try? p.persist(to: URL(string: "www.globol.com")!)


