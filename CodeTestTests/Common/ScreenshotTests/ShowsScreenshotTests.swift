//
//  ShowsScreenshotTests.swift
//  CodeTestTests
//
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import FBSnapshotTestCase
import KIF
@testable import CodeTest

class ShowsScreenshotTests: BaseScreenshotTests {
    
    var view: ShowsViewSpy!
    var repository: MockShowsRepository = TestAssembler.resolve()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testShows(){
        //recordMode = true
        
        let showsController = ShowsViewController(viewModel: ShowsViewModel(router: AppAssembler.resolve(), showsRepository: repository))
        repository.mockedData = MockedShows().data()

        makeWindowForViewController(viewController: showsController)
        
        if let view = self.tester().waitForView(withAccessibilityIdentifier: "showsView") {
            self.tester().waitForAnimationsToFinish()

            FBSnapshotVerifyView(view)
        }
        else{
            XCTFail()
        }
    }
        
}
