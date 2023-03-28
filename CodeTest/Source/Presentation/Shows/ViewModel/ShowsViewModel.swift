//
//  ShowsViewModel.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 13/2/23.
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class ShowsViewModel<V: ShowsViewProtocol>: BaseViewControllerViewModel<V> {
    let router: MainRouter
    fileprivate var showsRepository: ShowsRepositoryProtocol
    
    var shows: [Show] = []

    init(router: MainRouter, showsRepository: ShowsRepositoryProtocol) {
        self.router = router
        self.showsRepository = showsRepository
        super.init()
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
    }

    func loadShows() {
        showsRepository.loadShows(page: 0) { [weak self] shows, error in
            if let rShows = shows {
                self?.shows = rShows
                self?.view?.loadShowsSuccess()
            }
            if error != nil {
                self?.view?.loadShowsError()
            }
        }
    }
    
    func navigateToShowDetails(show: Show) {
        //router.navigateToShowDetails(show: show)
    }
    
    func getShow(index: Int) -> Show? {
        if index < shows.count {
            return shows[index]
        }
        return nil
    }
}
