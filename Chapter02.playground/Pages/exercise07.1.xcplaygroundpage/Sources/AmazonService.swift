import Foundation

public class AmazonService {
    private var balance: Float = 0
    
    public init() { }
    
    private func orderPlaced(payment: Float) {
        balance += payment
    }
    
    private var earnings: Float {
        return balance
    }
}

extension AmazonService: Service {
    public var total: Float {
        return earnings
    }

    public func add(payment: Float) {
        orderPlaced(payment: payment)
    }
}
