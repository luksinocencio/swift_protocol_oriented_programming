import Foundation

public func make(service: ServiceType) -> Service {
    switch service {
    case .amazon:
        return AmazonService()
    case .etsy:
        return EtsyService()
    }
}
