//
//  VectorCalculatorTests.swift
//  VectorCalculatorTests
//
//  Created by Lena Hsieh on 2015-02-17.
//  Copyright (c) 2015 lhsieh. All rights reserved.
//

import XCTest

class VectorCalculatorTests: XCTestCase {
    let view = ViewController();
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // Tests validateCoordinates() with valid params
    func testValidateCoordinatesWithValidInputs() {
        let v = Vector(x: 100, y: -50, z: 60);
        
        let result = view.validateCoordinates(v);
        XCTAssert(result, "Error in testValidateCoordinatesWithValidInputs")
    }
    
    // Tests validateCoordinates() with invalid params
    func testValidateCoordinatesWithInvalidInputs() {
        let v = Vector(x: 1000, y: -50, z: 60);

        let result = view.validateCoordinates(v);
        XCTAssertFalse(result, "Error in testValidateCoordinatesWithInvalidInputs")
    }
    
    // Tests validateCoordinates() with valid boundry params
    func testValidateCoordinatesWithValidBoundryInput() {
        let v = Vector(x: 100, y: -100, z: 100);

        let result = view.validateCoordinates(v);
        XCTAssertTrue(result, "Error in testValidateCoordinatesWithValidBoundryInput");
    }
    
    // Tests validateCoordinates() with invalid boundry params
    func testValidateCoordinatesWithInvalidBoundryInput() {
        let v = Vector(x: 101, y: -101, z: 101);

        let result = view.validateCoordinates(v);
        XCTAssertFalse(result, "Error in testValidateCoordinatesWithInvalidBoundryInput");
    }
    
}
