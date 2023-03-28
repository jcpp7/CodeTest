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
    
    var storedShows: [Show] = []
    var page = 0
    var canAskForTransactions = true

    init(router: MainRouter, showsRepository: ShowsRepositoryProtocol) {
        self.router = router
        self.showsRepository = showsRepository
        super.init()
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
    }

    func reloadShows() {
        page -= 1
        loadShows()
    }
    
    func loadShows() {
        if canAskForTransactions {
            print("Ask for page %i", page)
            if page == 0 {
                storedShows = []
            }
            canAskForTransactions = false
            showsRepository.loadShows(page: page) { [weak self] shows, error in
                if let rShows = shows {
                    self?.page += 1
                    self?.storedShows.append(contentsOf: rShows)
                    self?.canAskForTransactions = true
                    self?.view?.loadShowsSuccess()
                }
                if error != nil {
                    self?.canAskForTransactions = true
                    self?.view?.loadShowsError()
                }
            }
        }
    }
    
    func navigateToShowDetails(show: Show) {
        router.navigateToShowDetails(show: show)
    }
    
    func getShow(index: Int) -> Show? {
        if index < storedShows.count {
            return storedShows[index]
        }
        return nil
    }
}
