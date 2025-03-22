//
//  SignUpFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Konstantin Kolosov on 09.04.2022.
//  Copyright © 2022 Sergey Kargopolov. All rights reserved.
//

import XCTest
@testable import PhotoApp

class SignUpFormModelValidatorTests: XCTestCase {
    var sut: SignupFormModelValidator!

    override func setUp() {
        sut = SignupFormModelValidator()
    }

    override func tearDown() {
        sut = nil
    }

    func testSignupFromModelValidator_WnenValidFirstNameProvided_ShouldReturnTrue() {
        // Arrange

        // Act
        let result = sut.isFirstNameValid(firstName: "Konstantin")

        // Assert
        XCTAssertTrue(result, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }

    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Arrange

        // Act
        let result = sut.isFirstNameValid(firstName: "S")

        // Assert
        XCTAssertFalse(result, "Too short name!")
    }

    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        // Arrange

        // Act
        let result = sut.isFirstNameValid(firstName: "KonstantinKonstantin")

        // Assert
        XCTAssertFalse(result, "Too long name!")
    }

    // MARK: - Last Name
    func testSignupFromModelValidator_WnenValidLastNameProvided_ShouldReturnTrue() {
        // Arrange

        // Act
        let result = sut.isLastNameValid(lastName: "Konstantin")

        // Assert
        XCTAssertTrue(result, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }

    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        // Arrange

        // Act
        let result = sut.isLastNameValid(lastName: "S")

        // Assert
        XCTAssertFalse(result, "Too short name!")
    }

    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        // Arrange

        // Act
        let result = sut.isLastNameValid(lastName: "KonstantinKonstantin")

        // Assert
        XCTAssertFalse(result, "Too long name!")
    }

    // MARK: - Email
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        // Arrange

        // Act
        let result = sut.isValidEmailFormat(email: "rayleefx@gmail.com")

        // Assert
        XCTAssertTrue(result, "Wrong Email")
    }

    func testSignupFormModelValidator_WhenWrongEmailProvided_ShouldReturnFalse() {
        // Arrange

        // Act
        let result = sut.isValidEmailFormat(email: "rayleefxgmailcom")

        // Assert
        XCTAssertFalse(result)
    }

    // MARK: - Password
    func testSignupFromModelValidator_WnenValidPasswordProvided_ShouldReturnTrue() {
        // Arrange

        // Act
        let result = sut.isPasswordValid(password: "AaZzSs1213")

        // Assert
        XCTAssertTrue(result, "Incorrect Password")
    }

    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        // Arrange

        // Act
        let result = sut.isPasswordValid(password: "123")

        // Assert
        XCTAssertFalse(result)
    }

    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        // Arrange

        // Act
        let result = sut.isPasswordValid(password: "123 456 789 123 456")

        // Assert
        XCTAssertFalse(result)
    }

    func testSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        // Act
        let doPasswordMatch = sut.doPasswordsMatch(password: "123321123", repeatPassword: "123321123")

        XCTAssertTrue(doPasswordMatch, "Password is not match")
    }

    func testSignupFormModelValidator_WhenUnequalPasswordsProvided_ShouldReturnTrue() {
        // Act
        let doPasswordMatch = sut.doPasswordsMatch(password: "1233211232", repeatPassword: "123321123")

        XCTAssertFalse(doPasswordMatch)
    }
}
