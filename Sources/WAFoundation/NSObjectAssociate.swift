//
//  NSObjectAssociate.swift
//  WAFoundation
//
//  Created by Panghu on 3/21/20.
//

import Foundation

extension WAFoundationDSL where Target: NSObject {
    
    private struct AssociateWeakObject {
        weak var value: AnyObject?
    }
    
    private func transform(value: Any?) -> Any? {
        return AssociateWeakObject(value: value as AnyObject)
    }
    
    private func get<Type>(value: Any?, type: Type.Type) -> Type? {
        guard let object = value as? AssociateWeakObject else {
            return value as? Type
        }
        return object.value as? Type
    }
    
    //MARK: - Public
    
    public func setAssociate(_ value: Any?, _ key: UnsafeRawPointer) {
        objc_setAssociatedObject(target, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    public func setAssociateWeak(_ value: Any?, _ key: UnsafeRawPointer) {
        objc_setAssociatedObject(target, key, transform(value: value), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    public func associate<Type>(_ key: UnsafeRawPointer, _ type: Type.Type) -> Type? {
        return get(value: objc_getAssociatedObject(target, key), type: type)
    }

    public func removeAssociated() {
        objc_removeAssociatedObjects(target);
    }
}
