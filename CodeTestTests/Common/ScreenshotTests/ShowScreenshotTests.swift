//
//  PostScreenshotTests.swift
//  CodeTestTests
//
//  Created by Jose Cruz Perez Pi on 28/3/23.
//

import FBSnapshotTestCase
import KIF
@testable import CodeTest

class ShowScreenshotTests: BaseScreenshotTests {
    
    var view: ShowsViewSpy!
    var repository: MockShowsRepository = TestAssembler.resolve()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testShow(){
        //recordMode = true
        
        let showController = ShowViewController(viewModel: ShowViewModel(router: AppAssembler.resolve(), show: Show(id: 1, image: ShowImage(medium: ""), name: "El señor de los anillos", rating: Average(average: 9.5), summary: "")))
        repository.mockedData = MockedShows().data()

        makeWindowForViewController(viewController: showController)
        
        if let view = self.tester().waitForView(withAccessibilityIdentifier: "showView") {
            self.tester().waitForAnimationsToFinish()

            FBSnapshotVerifyView(view)
        }
        else{
            XCTFail()
        }
    }
        
}
