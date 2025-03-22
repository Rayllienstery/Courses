//
//  CICDCourseAppTests.swift
//  CICDCourseAppTests
//
//  Created by Konstantin Kolosov on 12.02.2024.
//

import XCTest
@testable import CICDCourseApp

final class CICDCourseAppTests: XCTestCase {
    static var calc: CalculationManager?

    override class func setUp() {
        self.calc = .init()
    }

    override class func tearDown() {
        self.calc = nil
    }

    func testSum() {
        let result = Self.calc?.getSum(one: 5, two: 10)
        XCTAssertEqual(result, 15)
    }

    func testDif() {
        let result = Self.calc?.getDif(one: 5, two: 10)
        XCTAssertEqual(result, -5)
    }

    func testMul() {
        let result = Self.calc?.getMul(one: 5, two: 10)
        XCTAssertEqual(result, 50)
    }

    func testPar() {
        let result = Self.calc?.getPar(one: 5, two: 10)
        XCTAssertEqual(result, 0)
    }
}
