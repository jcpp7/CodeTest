//
//  ShowsViewSpy.swift
//  CodeTestTests
//
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import UIKit
import XCTest
@testable import CodeTest

class ShowsViewSpy: BaseViewControllerProtocol, ShowsViewProtocol {
    func showAlert(title: String, message: String, actionText: String, action: (() -> Void)?) {
        guard let expectation = asyncExpectation else {
            XCTFail("Spy was not setup correctly. Missing XCTExpectation reference")
            return
        }
        expectation.fulfill()
    }
    
    var asyncExpectation: XCTestExpectation?

    func loadShowsSuccess() {
        guard let expectation = asyncExpectation else {
            XCTFail("Spy was not setup correctly. Missing XCTExpectation reference")
            return
        }
        expectation.fulfill()
    }
     
    func loadShowsError() {
        guard let expectation = asyncExpectation else {
            XCTFail("Spy was not setup correctly. Missing XCTExpectation reference")
            return
        }
        expectation.fulfill()
    }
}
