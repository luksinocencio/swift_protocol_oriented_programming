import Foundation

class PaymentController {
    let services: [Service]
    
    init(services: [Service]) {
        self.services = services
    }
    
    func calculateEarnings() -> Float {
        services.reduce(0) { $0 + $1.total }
    }
}

var amazonService = make(service: .amazon)
var etsyService = make(service: .etsy)

amazonService.add(payment: 100)
etsyService.add(payment: 25)
amazonService.add(payment: 12.50)

let controller = PaymentController(services: [amazonService, etsyService])
print("\(controller.calculateEarnings())")

/**
 - Introduce a public Service protocol and define the property and method requirements ✅
 - Adopt the protocol by declaring AmazonService and EtsyService type extensions ✅
 - Hide the concrete types by changing their visibility levels ✅
 - Create a factory method that returns a Service protocol based on an identifier ✅
 - Optionally, you can embed the factory method in a helper type ✅
 - Remove the concrete service type references from the PaymentController. Instead, rely on the Service protocol ✅
 */
