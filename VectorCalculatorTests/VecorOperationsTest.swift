//
//  ScalarProductTest.swift
//  VectorCalculator
//
//  Created by Lena Hsieh on 2015-02-17.
//  Copyright (c) 2015 lhsieh. All rights reserved.
//

import XCTest

class VectorOperationsTest: XCTestCase {
    let view = ViewController()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // Tests vectorAddition() with valid params
    func testVectorAdditionValidInputs() {
        let a = Vector(x: 4, y: 6)
        let b = Vector(x: 5, y: 10)
        let c = Vector(x: 2, y: 2)
        
        let result = view.vectorAddition(a, b: b, c: c)
        XCTAssertEqual(result.x, 11, "Error in testVectorAdditionValidInputs x value")
        XCTAssertEqual(result.y, 18, "Error in testVectorAdditionValidInputs y value")
    }
    
    // Tests vectorAddition() with valid boundary params
    func testVectorAdditionValidBoundaryInputs() {
        let a = Vector(x: 100, y: -100)
        let b = Vector(x: -100, y: 100)
        let c = Vector(x: -100, y: 100)
        
        let result = view.vectorAddition(a, b: b, c: c)
        XCTAssertEqual(result.x, -100, "Error in testVectorAdditionValidInputs x value")
        XCTAssertEqual(result.y, 100, "Error in testVectorAdditionValidInputs y value")
    }
    
    // Tests scalarProduct() with valid params
    func testScalarProductValidInputs() {
        let a = Vector(x: -6, y: 8)
        let b = Vector(x: 5, y: 12)
        
        let result = view.scalarProduct(a, b: b)
        XCTAssertEqual(result, 66, "Error in testScalarProduct")
    }
    
    // Tests scalarProduct() with valid boundary params
    func testScalarProductValidBoundryInputs() {
        let a = Vector(x: -100, y: 100)
        let b = Vector(x: 100, y: -100)
        
        let result = view.scalarProduct(a, b: b)
        XCTAssertEqual(result, -20000, "Error in testScalarProductValidBoundryInputs")
    }
    
    func testVectorProductValidInputs() {
        let a = Vector(x: 10, y: 20)
        let b = Vector(x: 15, y: -55)
        
        let result = view.vectorProduct(a, b: b)
        XCTAssertEqual(result, -850, "Error in testVectorProductValidInputs")
    }
    
    func testVectorProductValidBounaryInputs() {
        let a = Vector(x: 100, y: 100)
        let b = Vector(x: -100, y: -100)
        
        let result = view.vectorProduct(a, b: b)
        XCTAssertEqual(result, 0, "Error in testVectorProductValidInputs")
    }
}