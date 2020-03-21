//
//  DSL.swift
//  WAFoundation
//
//  Created by Panghu on 3/21/20.
//

public class WAFoundationDSL<Target> {
    
    public let target: Target
    
    public init(_ target: Target) {
        self.target = target
    }
}

public protocol WAFoundationCompatible {
    
    associatedtype CompatibleType
    
    var wa: WAFoundationDSL<CompatibleType> { get set }
    static var wa: WAFoundationDSL<CompatibleType>.Type { get set }
}

extension WAFoundationCompatible {
    
    public var wa: WAFoundationDSL<Self> {
        get { return WAFoundationDSL(self) }
        set { }
    }
    
    public static var wa: WAFoundationDSL<Self>.Type {
        get { return WAFoundationDSL<Self>.self }
        set { }
    }
}

import class Foundation.NSObject

extension NSObject: WAFoundationCompatible { }
