import Foundation

// Starting with a Class

class TaggedData {
    var tag: String
    var data: Data
    var base64EncodedString: String {
        data.base64EncodedString()
    }
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
    
    convenience init(tag: String, contentOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self.init(tag: tag, data: data)
    }
    
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
}
