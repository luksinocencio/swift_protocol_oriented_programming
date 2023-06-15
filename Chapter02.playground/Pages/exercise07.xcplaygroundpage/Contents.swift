import Foundation

public class AmazonService {
    private var balance: Float = 0
    
    public init() { }
    
    public func orderPlaced(payment: Float) {
        balance += payment
    }
    
    public var earnings: Float {
        return balance
    }
}

public class EtsyService {
    private var earnings: Float = 0
    
    public init() { }
    
    public func itemSold(profit: Float) {
        earnings += profit
    }
    
    public var totalSold: Float {
        return earnings
    }
}

class PaymentController {
    let amazonService: AmazonService
    let etsyService: EtsyService
    
    init(amazon: AmazonService, etsy: EtsyService) {
        amazonService = amazon
        etsyService = etsy
    }
    
    func calculateEarnings() -> Float {
        amazonService.earnings + etsyService.totalSold
    }
}

let amazonService = AmazonService()
let etsyService = EtsyService()

let controller = PaymentController(amazon: amazonService, etsy: etsyService)
amazonService.orderPlaced(payment: 100)
etsyService.itemSold(profit: 25)
amazonService.orderPlaced(payment: 12.50)

print("Total earned: \(controller.calculateEarnings())")
/**
 - Introduce a public Service protocol and define the property and method requirements
 - Adopt the protocol by declaring AmazonService and EtsyService type extensions
 - Hide the concrete types by changing their visibility levels
 - Create a factory method that returns a Service protocol based on an identifier
 - Optionally, you can embed the factory method in a helper type
 - Remove the concrete service type references from the PaymentController. Instead, rely on the Service protocol
 */
