import Foundation

public enum InstanceType {
    case newInstance
    case sharedInstance
}

public protocol DIContainer {
    func registerService<Service>(_ serviceType: Service.Type, factory: @escaping (DIResolver) -> Service)
    func registerService<Service>(_ serviceType: Service.Type, instanceType: InstanceType, factory: @escaping (DIResolver) -> Service)
}

extension DIContainer {
    public func registerService<Service>(_ serviceType: Service.Type, factory: @escaping (DIResolver) -> Service) {
        self.registerService(serviceType, instanceType: .sharedInstance, factory: factory)
    }
}
