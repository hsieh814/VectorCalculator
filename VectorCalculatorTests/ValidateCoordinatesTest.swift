//
//  VectorCalculatorTests.swift
//  VectorCalculatorTests
//
//  Created by Lena Hsieh on 2015-02-17.
//  Copyright (c) 2015 lhsieh. All rights reserved.
//

import XCTest

class ValidateCoordinatesTest: XCTestCase {
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
    
    // Tests validateCoordinates() with invalid min x param
    func testValidateCoordinatesWithInvalidMinXInputs() {
        let result = view.validateCoordinates(-3, y: 11)
        XCTAssertFalse(result, "Error in testValidateCoordinatesWithInvalidMinXInputs")
    }
    
    // Tests validateCoordinates() with invalid max x param
    func testValidateCoordinatesWithInvalidMaxXInputs() {
        let result = view.validateCoordinates(28, y: 11)
        XCTAssertFalse(result, "Error in testValidateCoordinatesWithInvalidMaxXInputs")
    }
    
    // Tests validateCoordinates() with invalid y param
    func testValidateCoordinatesWithInvalidMinYInputs() {
        let result = view.validateCoordinates(5, y: -6)
        XCTAssertFalse(result, "Error in testValidateCoordinatesWithInvalidYMinYInputs")
    }
    
    // Tests validateCoordinates() with invalid y param
    func testValidateCoordinatesWithInvalidMaxYInputs() {
        let result = view.validateCoordinates(5, y: 25)
        XCTAssertFalse(result, "Error in testValidateCoordinatesWithInvalidYMaxYInputs")
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
