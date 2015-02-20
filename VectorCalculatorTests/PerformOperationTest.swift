//
//  PerformOperationTest.swift
//  VectorCalculator
//
//  Created by Lena Hsieh on 2015-02-19.
//  Copyright (c) 2015 lhsieh. All rights reserved.
//

import UIKit
import XCTest

class PerformOperationTest: XCTestCase {
    let view = ViewController()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // Tests performOperation() for vector addition with valid inputs
    func testPerformOperationVectorAdditionWithValidInputs() {
        let a = Vector(x: 9, y: 8)
        let b = Vector(x: 10, y: 10)
        let c = Vector(x: 1, y: 1)
        let result = view.performOperation(0, a: a, b: b, c: c)
        XCTAssertEqual(result, "20, 19", "Error in testPerformOperationVectorAdditionWithValidInputs")
    }
    
    // Tests performOperation() for scalar product with valid inputs
    func testPerformOperationScalarProductWithValidInputs() {
        let a = Vector(x: 9, y: 8)
        let b = Vector(x: 10, y: 10)
        let c = Vector(x: 0, y: 0)
        let result = view.performOperation(1, a: a, b: b, c: c)
        XCTAssertEqual(result, "170", "Error in testPerformOperationScalarProductWithValidInputs")
    }
    
    // Tests performOperation() for vector product with valid inputs
    func testPerformOperationVectorProductWithValidInputs() {
        let a = Vector(x: 9, y: 8)
        let b = Vector(x: 10, y: 10)
        let c = Vector(x: 0, y: 0)
        let result = view.performOperation(2, a: a, b: b, c: c)
        XCTAssertEqual(result, "10", "Error in testPerformOperationVectorProductWithValidInputs")
    }
    
    // Tests performOperation() for invalid operation
    func testPerformOperationForInvalidOperation() {
        let a = Vector(x: 9, y: 8)
        let b = Vector(x: 10, y: 10)
        let c = Vector(x: 0, y: 0)
        let result = view.performOperation(3, a: a, b: b, c: c)
        XCTAssertEqual(result, "ERROR", "Error in testPerformOperationForInvalidOperation")
    }

}
