import Foundation

// working with generic types

struct StringWrapper {
    var storage: String
}

struct DataWrapper {
    var storage: Date
}

//struct Wrapper<T> {
//    var storage: T
//
//    init(_ value: T) {
//        storage = value
//    }
//}

//let piWrapped = Wrapper<Double>(Double.pi)
//let stringWrapped = Wrapper("POP")
//let dateWrapped = Wrapper(Date())

struct Wrapper<T: Equatable> {
    var storage: T

    init(_ value: T) {
        storage = value
    }
}

let piWrapped = Wrapper<Double>(Double.pi)
let stringWrapped = Wrapper("POP")
let dateWrapped = Wrapper(Date())
