//
//  CryptoViewController.swift
//  CryptoCoin
//
//  Created by mogggiii on 21.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CryptoDisplayLogic: class {
  func displayData(viewModel: Crypto.Model.ViewModel.ViewModelData)
}

class CryptoViewController: UITableViewController, CryptoDisplayLogic {

  var interactor: CryptoBusinessLogic?
  var router: (NSObjectProtocol & CryptoRoutingLogic)?

  @IBOutlet weak var table_view: UITableView! {
    didSet {
      
    }
  }

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = CryptoInteractor()
    let presenter             = CryptoPresenter()
    let router                = CryptoRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func displayData(viewModel: Crypto.Model.ViewModel.ViewModelData) {

  }
  
}
