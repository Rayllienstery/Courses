//
//  MockURLProtocol.swift
//  PhotoApp
//
//  Created by Konstantin Kolosov on 10.04.2022.
//  Copyright © 2022 Sergey Kargopolov. All rights reserved.
//

import Foundation


class MockURLProtocol: URLProtocol {
    
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    
    override func startLoading() {
 
        if let signupError = MockURLProtocol.error {
            self.client?.urlProtocol(self, didFailWithError: signupError)
        } else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
 
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() { }
    
}

