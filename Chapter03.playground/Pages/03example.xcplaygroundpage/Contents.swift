import Foundation

// redesigning using protocols

protocol TaggedData {
    var tag: String { get set }
    var data: Data { get set }
    init(tag: String, data: Data)
}

protocol TaggedDataPersisting: TaggedData {
    init(tag: String, contentOf url: URL) throws
    func persist(to url: URL) throws
}

extension TaggedDataPersisting {
    init(tag: String, contentOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self.init(tag: tag, data: data)
    }
    
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
}

protocol TaggedDataEncoding: TaggedData {
    var base64EncodedString: String { get }
}

extension TaggedDataEncoding {
    var base64EncodedString: String {
        return data.base64EncodedString()
    }
}

//class MyTaggedData: TaggedData {
//    var tag: String
//    var data: Data
//
//    required init(tag: String, data: Data) {
//        self.tag = tag
//        self.data = data
//    }
//}

//struct MyTaggedData: TaggedData {
//    var tag: String
//    var data: Data
//}
//
//let taggedData = MyTaggedData(tag: "first", data: Data(repeating: 0, count: 1))

//struct MyTaggedData: TaggedDataPersisting {
//    var tag: String
//    var data: Data
//}
//
//let taggedData = MyTaggedData(tag: "first", data: Data(repeating: 0, count: 1))
//let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//let url = documentsURL.appendingPathComponent("tagged")
//
//try? taggedData.persist(to: url)

//struct MyTaggedData: TaggedDataPersisting, TaggedDataEncoding {
//    let str = taggedData.base64Enconded
//}
