//
//  VectorCalculatorTests.swift
//  VectorCalculatorTests
//
//  Created by Lena Hsieh on 2015-02-17.
//  Copyright (c) 2015 lhsieh. All rights reserved.
//

import XCTest

class VectorCalculatorTests: XCTestCase {
    let view = ViewController()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // Tests validateCoordinates() with valid params
    func testValidateCoordinatesWithValidInputs() {
        let result = view.validateCoordinates(4, y: 7)
        XCTAssert(result, "Error in testValidateCoordinatesWithValidInputs")
    }
    
    // Tests validateCoordinates() with invalid params
    func testValidateCoordinatesWithInvalidInputs() {
        let result = view.validateCoordinates(-3, y: 11)
        XCTAssertFalse(result, "Error in testValidateCoordinatesWithInvalidInputs")
    }
    
    // Tests validateCoordinates() with valid boundry params
    func testValidateCoordinatesWithValidBoundryInput() {
        let result = view.validateCoordinates(0, y: 20)
        XCTAssertTrue(result, "Error in testValidateCoordinatesWithValidBoundryInput")
    }
    
    // Tests validateCoordinates() with invalid boundry params
    func testValidateCoordinatesWithInvalidBoundryInput() {
        let result = view.validateCoordinates(-1, y: 21)
        XCTAssertFalse(result, "Error in testValidateCoordinatesWithInvalidBoundryInput")
    }
    
    // Tests validateCoordinates() with nil params
    func testValidateCoordinatesWithNilInput() {
        let result = view.validateCoordinates(nil, y: 21)
        XCTAssertFalse(result, "Error in testValidateCoordinatesWithNilInput")
    }
}
