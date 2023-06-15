import Foundation

public class EtsyService {
    private var earnings: Float = 0
    
    public init() { }
    
    private func itemSold(profit: Float) {
        earnings += profit
    }
    
    private var totalSold: Float {
        return earnings
    }
}

extension EtsyService: Service {
    public var total: Float {
        return totalSold
    }

    public func add(payment: Float) {
        itemSold(profit: payment)
    }
}
