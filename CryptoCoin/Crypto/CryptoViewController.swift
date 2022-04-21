//
//  CryptoViewController.swift
//  CryptoCoin
//
//  Created by mogggiii on 22.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CryptoDisplayLogic: class {
	func displayData(viewModel: Crypto.Model.ViewModel.ViewModelData)
}

class CryptoViewController: UITableViewController, CryptoDisplayLogic {
	
	var cryptoViewModel = CryptoViewModel.init(cells: [])
	var interactor: CryptoBusinessLogic?
	var router: (NSObjectProtocol & CryptoRoutingLogic)?
	
	// MARK: Object lifecycle
	
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
		setup()
		
		tableView.register(CryptoCell.self, forCellReuseIdentifier: "cellId")
		fetchCoins()
	}
	
	func displayData(viewModel: Crypto.Model.ViewModel.ViewModelData) {
		switch viewModel {
		case .displayCrypto(cryptoViewModel: let cryptoViewModel):
			self.cryptoViewModel = cryptoViewModel
			self.tableView.reloadData()
		}
	}
	
	func fetchCoins() {
		interactor?.makeRequest(request: .fetchCrypto)
	}
	
	// MARK: - Table View Data Source
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cryptoViewModel.cells.count
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 84
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CryptoCell
		let cellViewModel = cryptoViewModel.cells[indexPath.row]
		cell.set(viewModel: cellViewModel)
		
		return cell
	}
}
