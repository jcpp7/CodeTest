//
//  ShowsViewControler.swift
//  CodeTest
//
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import UIKit
import CoreData
import SwiftSpinner

protocol ShowsViewProtocol: BaseViewControllerProtocol {
    func loadShowsSuccess()
    func loadShowsError()
}

class ShowsViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let standardMargin = 8.0
    
    var viewType: Bool = false {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var viewModel: ShowsViewModel<ShowsViewController>
    
    init(viewModel: ShowsViewModel<ShowsViewController>) {
        
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func getViewModel() -> BaseViewControllerViewModelProtocol? {
        return viewModel
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationButtons()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadShows()
    }
    
    private func configureNavigationButtons() {
        title = L10n.bookstoreTitle.text
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Asset.Colors.baseColor.uiColor]
        
        let changeViewButton = UIBarButtonItem(image: Asset.Images.menuGrid.image, style: .plain, target: self, action: #selector(changeViewType))
        self.navigationItem.leftBarButtonItem = changeViewButton
        navigationItem.leftBarButtonItem?.tintColor = Asset.Colors.baseColor.uiColor
        navigationItem.leftBarButtonItem?.accessibilityLabel = L10n.menuGridAccesibilityLabel.text
        
        let reloadButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reloadShows))
        navigationItem.rightBarButtonItem = reloadButton
        navigationItem.rightBarButtonItem?.tintColor = Asset.Colors.baseColor.uiColor
    }
    
    private func configureCollectionView() {
        collectionView.register(UINib(nibName: ShowBigCell.identifier, bundle: nil), forCellWithReuseIdentifier: ShowBigCell.identifier)
        collectionView.register(UINib(nibName: ShowSmallCell.identifier, bundle: nil), forCellWithReuseIdentifier: ShowSmallCell.identifier)
    }
    
    private func loadShows() {
        SwiftSpinner.show(L10n.loaderLoading.text)
        viewModel.loadShows()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigateToShowDetails(index: IndexPath) {
        //let show = //
        //viewModel.navigateToShowDetails(show: show)
    }
    
    @objc func changeViewType(_ sender: UIBarButtonItem) {
        sender.image = viewType ?  Asset.Images.menuGrid.image :  Asset.Images.menuList.image
        sender.accessibilityLabel = viewType ? L10n.menuGridAccesibilityLabel.text : L10n.menuListAccesibilityLabel.text
        
        viewType = !viewType
    }
    
    @objc func reloadShows() {
        SwiftSpinner.show(L10n.loaderLoading.text)
        viewModel.reloadShows()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension ShowsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.storedShows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return viewType ? getSmallCell(indexPath: indexPath) : getBigCell(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigateToShowDetails(index: indexPath)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width <= UIScreen.main.bounds.height ?
        UIScreen.main.bounds.width - 32 :
        UIScreen.main.bounds.height - 16
        
        let smallCellWidth = (screenWidth - 32)/3
        return viewType ? CGSize(width: smallCellWidth,
                                 height: ShowSmallCell.height) : CGSize(width: collectionView.frame.width - 32,
                                                                        height: ShowBigCell.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return viewType ? UIEdgeInsets(top: standardMargin,
                                       left: standardMargin,
                                       bottom: standardMargin,
                                       right: standardMargin) : UIEdgeInsets(top: 0,
                                                                             left: 0,
                                                                             bottom: 0,
                                                                             right: 0)
    }
    
    private func getBigCell(indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowBigCell.identifier, for: indexPath) as? ShowBigCell,
            let show = viewModel.getShow(index: indexPath.row) {
            cell.configure(show: show)
            return cell
        }
        return UICollectionViewCell()
    }
    
    private func getSmallCell(indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowSmallCell.identifier,
                                                         for: indexPath) as? ShowSmallCell,
           viewType == true, let show = viewModel.getShow(index: indexPath.row) {
            cell.configure(show: show)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = collectionView.frame.size.height
        let contentYoffset = collectionView.contentOffset.y
        let distanceFromBottom = collectionView.contentSize.height - contentYoffset
        
        if distanceFromBottom - height < 150 {
            self.loadShows()
        }
    }
}

extension ShowsViewController: ShowsViewProtocol {
    func loadShowsSuccess() {
        SwiftSpinner.hide {
            self.collectionView.reloadData()
        }
    }

    func loadShowsError() {
        SwiftSpinner.hide {
            self.showAlert(title: L10n.showsErrorLoadingTitle.text,
                      message: L10n.showsErrorLoadingMessage.text,
                      actionText: L10n.showsErrorLoadingRetryButton.text, action: {
                self.loadShows()
            })
        }
    }
}
