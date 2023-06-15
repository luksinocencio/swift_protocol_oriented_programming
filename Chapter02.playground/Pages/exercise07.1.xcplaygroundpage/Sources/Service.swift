import Foundation

public protocol Service {
    var total: Float { get }
    mutating func add(payment: Float)
}

public enum ServiceType {
    case amazon
    case etsy
}
