import Foundation

// subclassing for a modular design

class TaggedData {
    var tag: String
    var data: Data
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
}

class PersistentTaggedData: TaggedData {
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
    
    convenience init(tag: String, contentOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self.init(tag: tag, data: data)
    }
}

class TaggedDataWithEncoding: TaggedData {
    var base64EncodedString: String {
        data.base64EncodedString()
    }
}
