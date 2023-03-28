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
    
    func testReloadShowsSuccess() {
        
        //Given
        let expectation = XCTestExpectation(description: "expectation")
        self.view.asyncExpectation = expectation
        repository.mockedData = MockedShows().data()
       
        //When
        self.sut.reloadShows()
        
        //Then
        self.wait(for: [expectation], timeout: 10)
    }
    
    func testReloadShowsError() {
        
        //Given
        let expectation = XCTestExpectation(description: "expectation")
        self.view.asyncExpectation = expectation
        repository.mockedError = MockShowsRepository.ShowsError.noInternet
       
        //When
        self.sut.reloadShows()
        
        //Then
        self.wait(for: [expectation], timeout: 10)
    }
    
    func testRemoveDuplicates() {

        //Given
        let expectation = XCTestExpectation(description: "expectation")
        self.view.asyncExpectation = expectation
        self.sut.storedShows = [Show(id: 1, image: ShowImage(medium: ""), name: "", summary: ""), Show(id: 1, image: ShowImage(medium: ""), name: "", summary: "")]
        
        //When
        self.sut.removeDuplicates()
        
        //Then
        self.wait(for: [expectation], timeout: 10)
        XCTAssertEqual(self.sut.storedShows.count, 1)
    }
    
    func testGetShow() {

        //Given
        self.sut.storedShows = [Show(id: 1, image: ShowImage(medium: ""), name: "", summary: ""), Show(id: 2, image: ShowImage(medium: ""), name: "", summary: ""), Show(id: 3, image: ShowImage(medium: ""), name: "", summary: "")]
        
        //When
        let show = self.sut.getShow(index: 1)
        
        //Then
        XCTAssertEqual(show?.id, 2)
    }
    
    func testGetNonexistingShow() {

        //Given
        self.sut.storedShows = [Show(id: 1, image: ShowImage(medium: ""), name: "", summary: ""), Show(id: 2, image: ShowImage(medium: ""), name: "", summary: ""), Show(id: 3, image: ShowImage(medium: ""), name: "", summary: "")]
        
        //When
        let show = self.sut.getShow(index: 6)
        
        //Then
        XCTAssertNil(show)
    }
}
