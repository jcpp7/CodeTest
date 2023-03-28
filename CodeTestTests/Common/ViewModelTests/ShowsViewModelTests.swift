//
//  ShowsViewModelTests.swift
//  CodeTestTests
//
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import XCTest
@testable import CodeTest

class ShowsViewModelTests: XCTestCase {
    
    var sut: ShowsViewModel<ShowsViewSpy>!
    var view: ShowsViewSpy!
    var repository: MockShowsRepository = TestAssembler.resolve()
    
    override func setUp() {
        super.setUp()
        
        self.sut = ShowsViewModel(router: AppAssembler.resolve(), showsRepository: repository)
        self.view = ShowsViewSpy()
        self.sut.view = self.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadShowsSuccess() {
        
        //Given
        let expectation = XCTestExpectation(description: "expectation")
        self.view.asyncExpectation = expectation
        repository.mockedData = MockedShows().data()
       
        //When
        self.sut.loadShows()
        
        //Then
        self.wait(for: [expectation], timeout: 10)
    }
    
    func testLoadShowsError() {
        
        //Given
        let expectation = XCTestExpectation(description: "expectation")
        self.view.asyncExpectation = expectation
        repository.mockedError = MockShowsRepository.ShowsError.noInternet
       
        //When
        self.sut.loadShows()
        
        //Then
        self.wait(for: [expectation], timeout: 10)
    }
}
