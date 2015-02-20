//
//  CartesianGraphViewTest.swift
//  VectorCalculator
//
//  Created by Lena Hsieh on 2015-02-20.
//  Copyright (c) 2015 lhsieh. All rights reserved.
//

import UIKit
import XCTest

class CartesianGraphViewTest: XCTestCase {
    let view  = CartesianGraphView()
    
    override func setUp() {
        super.setUp()
        view.drawRect(CGRectMake(0, 0, 260, 260))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // Tests drawRect() which is called in setUp(). Makes sure all the class var are correct.
    func testDrawRect() {
        XCTAssertEqual(Float(view.width), Float(260.0), "Error in testDrawRect: wrong width set")
        XCTAssertEqual(Float(view.height), Float(260.0), "Error in testDrawRect: wrong height set")
        XCTAssertEqual(Float(view.graphWidth), Float(200.0), "Error in testDrawRect: wrong graph width set")
        XCTAssertEqual(Float(view.graphHeight), Float(200.0), "Error in testDrawRect: wrong graph height set")
    }
    
    // Tests calculateXLocation() with x=10
    func testCalculateXLocation() {
        var result: Float = Float(view.calculateXLocation(10))
        var expected: Float = 130.0
        XCTAssertEqual(result, expected, "Error in testCalculateXLocation")
    }
    
    // Tests calculateXLocation() with boundry input x=0
    func testCalculateXLocationAtMinBoundry() {
        var result: Float = Float(view.calculateXLocation(0))
        var expected: Float = 32.0
        XCTAssertEqual(result, expected, "Error in testCalculateXLocationAtMinBoundry")
    }
    
    // Tests calculateXLocation() with boundry input x=20
    func testCalculateXLocationAtMaxBoundry() {
        var result: Float = Float(view.calculateXLocation(20))
        var expected: Float = 228.0
        XCTAssertEqual(result, expected, "Error in testCalculateXLocationAtMaxBoundry")
    }
    
    // Tests calculateYLocation() with y=15
    func testCalculateYLocation() {
        var result: Float = Float(view.calculateYLocation(15))
        var expected: Float = 80.0
        XCTAssertEqual(result, expected, "Error in testCalculateYLocation")
    }
    
    // Tests calculateYLocation() with boundry input y=0
    func testCalculateYLocationAtMinBoundry() {
        var result: Float = Float(view.calculateYLocation(0))
        var expected: Float = 230.0
        XCTAssertEqual(result, expected, "Error in testCalculateYLocationAtMinBoundry")
    }
    
    // Tests calculateYLocation() with boundry input y=20
    func testCalculateYLocationAtMaxBoundry() {
        var result: Float = Float(view.calculateYLocation(20))
        var expected: Float = 30.0
        XCTAssertEqual(result, expected, "Error in testCalculateYLocationAtMaxBoundry")
    }
    
}
