//
//  SignUpWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Konstantin Kolosov on 10.04.2022.
//  Copyright © 2022 Sergey Kargopolov. All rights reserved.
//

import XCTest
@testable import PhotoApp

class SignUpWebServiceTests: XCTestCase {

    var sut: SignupWebService!
    var signFormRequestModel: SignupFormRequestModel!

    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        signFormRequestModel = SignupFormRequestModel(firstName: "Konstantin", lastName: "Kolosov", email: "rayleefx@protonmail.com", password: "QwerQwer")
    }

    override func tearDown() {
        sut = nil
        signFormRequestModel = nil
    }

    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        // Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)

        let expectation = self.expectation(description: "Signup Web Service Response Expectation")

        // Act
        sut.signup(withForm: signFormRequestModel) { response, error in
            // Assert
            XCTAssertEqual(response?.status, "ok")
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 5)
    }

    func testSignupWebService_WhenReceiverDifferentJSONResponse_ErrorTookPlace() {
        // Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)

        let expectation = self.expectation(description: "Signup Web Service Response Expectation")

        // Act
        sut.signup(withForm: signFormRequestModel) { response, error in
            // Assert
            XCTAssertNil(response)
            XCTAssertEqual(error, SignupError.invalidResponseModel)
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 5)
    }

    func testSignupWebService_WhenEmptyURLStringProvided_Error() {
        // Arrange
        sut = SignupWebService(urlString: "")

        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        // Act
        sut.signup(withForm: signFormRequestModel) { response, error in
            // Assert
            XCTAssertEqual(error, SignupError.invalidRequestURLString)
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 5)
    }

    func testSignupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription() {
        
        // Arrange
        let expectation = self.expectation(description: "A failed Request expectation")
        let errorDescription = "A localized description of an error"
        MockURLProtocol.error = SignupError.failedRequest(description:errorDescription)
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertEqual(error, SignupError.failedRequest(description:errorDescription), "The signup() method did not return an expecter error for the Failed Request")
            // XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
        
    }
}
