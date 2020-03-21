//
//  Tests.swift
//  Tests
//
//  Created by Panghu on 3/21/20.
//

import XCTest
import WAFoundation

private var intKey: UInt64 = 0
private var floatKey: UInt64 = 0
private var doubleKey: UInt64 = 0
private var boolKey: UInt64 = 0
private var stringKey: UInt64 = 0
private var numberKey: UInt64 = 0
private var objectKey: UInt64 = 0
private var swclassKey: UInt64 = 0
private var swstructKey: UInt64 = 0
private var weak1Key: UInt64 = 0
private var weak2Key: UInt64 = 0
private var weak3Key: UInt64 = 0

class Tests: XCTestCase {
    
    class SwiftClass {
        let value: Int
        init(_ i: Int) {
            value = i
        }
    }
    
    struct SwiftStruct {
        let value: Int
        init(_ i: Int) {
            value = i
        }
    }
    
    func testDSL() {
        XCTAssertNotNil(self.wa)
        XCTAssertNotNil(Tests.wa)
    }
    
    func testAssociate() {
        
        let associate = NSObject()
        let wa = associate.wa
        
        do {
            let int: Int = 1024
            wa.setAssociate(int, &intKey)
            let any = wa.associate(&intKey, Int.self)
            XCTAssertEqual(any, int)
        }
        
        do {
            let float: Float = 3.14
            wa.setAssociate(float, &floatKey)
            let any = wa.associate(&floatKey, Float.self)
            XCTAssertEqual(any, float)
        }
        
        do {
            let double: Double = 3.1415926
            wa.setAssociate(double, &doubleKey)
            let any = wa.associate(&doubleKey, Double.self)
            XCTAssertEqual(any, double)
        }
        
        do {
            let bool: Bool = true
            wa.setAssociate(bool, &boolKey)
            let any = wa.associate(&boolKey, Bool.self)
            XCTAssertEqual(any, bool)
        }
        
        do {
            let string: String = "abcdefg"
            wa.setAssociate(string, &stringKey)
            let any = wa.associate(&stringKey, String.self)
            XCTAssertEqual(any, string)
        }
        
        do {
            let number: NSNumber = .init(value: 3.1415926)
            wa.setAssociate(number, &numberKey)
            let any = wa.associate(&numberKey, NSNumber.self)
            XCTAssertEqual(any, number)
        }
        
        do {
            let object: NSObject = NSObject()
            wa.setAssociate(object, &objectKey)
            let any = wa.associate(&objectKey, NSObject.self)
            XCTAssertEqual(any, object)
        }
        
        do {
            let swclass = SwiftClass(100)
            wa.setAssociate(swclass, &swclassKey)
            let any = wa.associate(&swclassKey, SwiftClass.self)
            XCTAssertEqual(any?.value, swclass.value)
        }

        do {
            let swstruct = SwiftStruct(200)
            wa.setAssociate(swstruct, &swstructKey)
            let any = wa.associate(&swstructKey, SwiftStruct.self)
            XCTAssertEqual(any?.value, swstruct.value)
        }
    }
    
    func testAssociateOption() {
        
        let associate = NSObject()
        let wa = associate.wa
        
        do {
            let int: Int? = 1024
            wa.setAssociate(int, &intKey)
            var any = wa.associate(&intKey, Int.self)
            XCTAssertEqual(any, int)
            wa.setAssociate(nil, &intKey)
            any = wa.associate(&intKey, Int.self)
            XCTAssertNil(any)
        }
        
        do {
            let float: Float? = 3.14
            wa.setAssociate(float, &floatKey)
            var any = wa.associate(&floatKey, Float.self)
            XCTAssertEqual(any, float)
            wa.setAssociate(nil, &floatKey)
            any = wa.associate(&floatKey, Float.self)
            XCTAssertNil(any)
        }
        
        do {
            let double: Double? = 3.1415926
            wa.setAssociate(double, &doubleKey)
            var any = wa.associate(&doubleKey, Double.self)
            XCTAssertEqual(any, double)
            wa.setAssociate(nil, &doubleKey)
            any = wa.associate(&doubleKey, Double.self)
            XCTAssertNil(any)
        }
        
        do {
            let bool: Bool? = true
            wa.setAssociate(bool, &boolKey)
            var any = wa.associate(&boolKey, Bool.self)
            XCTAssertEqual(any, bool)
            wa.setAssociate(nil, &boolKey)
            any = wa.associate(&boolKey, Bool.self)
            XCTAssertNil(any)
        }
        
        do {
            let string: String? = "abcdefg"
            wa.setAssociate(string, &stringKey)
            var any = wa.associate(&stringKey, String.self)
            XCTAssertEqual(any, string)
            wa.setAssociate(nil, &stringKey)
            any = wa.associate(&stringKey, String.self)
            XCTAssertNil(any)
        }
        
        do {
            let number: NSNumber? = .init(value: 3.1415926)
            wa.setAssociate(number, &numberKey)
            var any = wa.associate(&numberKey, NSNumber.self)
            XCTAssertEqual(any, number)
            wa.setAssociate(nil, &numberKey)
            any = wa.associate(&numberKey, NSNumber.self)
            XCTAssertNil(any)
        }
        
        do {
            let object: NSObject? = NSObject()
            wa.setAssociate(object, &objectKey)
            var any = wa.associate(&objectKey, NSObject.self)
            XCTAssertEqual(any, object)
            wa.setAssociate(nil, &objectKey)
            any = wa.associate(&objectKey, NSObject.self)
            XCTAssertNil(any)
        }
        
        do {
            let swclass: SwiftClass? = SwiftClass(100)
            wa.setAssociate(swclass, &swclassKey)
            var any = wa.associate(&swclassKey, SwiftClass.self)
            XCTAssertEqual(any?.value, swclass?.value)
            wa.setAssociate(nil, &swclassKey)
            any = wa.associate(&swclassKey, SwiftClass.self)
            XCTAssertNil(any)
        }

        do {
            let swstruct: SwiftStruct? = SwiftStruct(200)
            wa.setAssociate(swstruct, &swstructKey)
            var any = wa.associate(&swstructKey, SwiftStruct.self)
            XCTAssertEqual(any?.value, swstruct?.value)
            wa.setAssociate(nil, &swstructKey)
            any = wa.associate(&swstructKey, SwiftStruct.self)
            XCTAssertNil(any)
        }
    }
    
    func testAssociateWeak() {
        
        let associate = NSObject()
        let wa = associate.wa
        
        weak var weak1: NSObject?
        weak var weak2: SwiftClass?
        var weak3: SwiftStruct?
        
        do {
            let any1 = NSObject()
            weak1 = any1
            wa.setAssociateWeak(weak1, &weak1Key)
            
            let any2 = SwiftClass(1024)
            weak2 = any2
            wa.setAssociateWeak(weak2, &weak2Key)
            
            let any3 = SwiftStruct(2048)
            weak3 = any3
            wa.setAssociateWeak(weak3, &weak3Key)
        }
        
        do {
            let v1 = wa.associate(&weak1Key, NSObject.self)
            let v2 = wa.associate(&weak2Key, SwiftClass.self)
            let v3 = wa.associate(&weak3Key, SwiftStruct.self)
            XCTAssertNil(v1)
            XCTAssertNil(v2)
            XCTAssertNil(v3)
        }
    }
}
