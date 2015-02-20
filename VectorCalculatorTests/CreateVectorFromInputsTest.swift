//
//  CreateVectorFromInputsTest.swift
//  VectorCalculator
//
//  Created by Lena Hsieh on 2015-02-19.
//  Copyright (c) 2015 lhsieh. All rights reserved.
//

import UIKit
import XCTest

class CreateVectorFromInputsTest: XCTestCase {
    let view = ViewController();

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // Tests createVectorFromInputs() with valid params
    func testCreateVectorFromInputsWithValidInputs() {
        let result = view.createVectorFromInputs(4, y: 7)
        XCTAssertEqual(result.x, 4, "Error in testCreateVectorFromInputsWithValidInputs")
        XCTAssertEqual(result.y, 7, "Error in testCreateVectorFromInputsWithValidInputs")
    }
    
    // Tests createVectorFromInputs() with one param not within range
    func testCreateVectorFromInputsWithInvalidRange() {
        let result = view.createVectorFromInputs(24, y: 7)
        XCTAssertEqual(result.x, 0, "Error in testCreateVectorFromInputsWithInvalidRange")
        XCTAssertEqual(result.y, 0, "Error in testCreateVectorFromInputsWithInvalidRange")
    }
    
    // Tests createVectorFromInputs() with one param not within range
    func testCreateVectorFromInputsWithNilParam() {
        let result = view.createVectorFromInputs(4, y: nil)
        XCTAssertEqual(result.x, 0, "Error in testCreateVectorFromInputsWithNilParam")
        XCTAssertEqual(result.y, 0, "Error in testCreateVectorFromInputsWithNilParam")
    }

}
