//
//  CryptoViewController.swift
//  CryptoCoin
//
//  Created by mogggiii on 22.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import JGProgressHUD

protocol CryptoDisplayLogic: AnyObject {
	func displayData(viewModel: Crypto.Model.ViewModel.ViewModelData)
}

class CryptoViewController: UITableViewController, CryptoDisplayLogic {
	
	fileprivate var cryptoViewModel = CryptoViewModel.init(cells: [])
	fileprivate let hud = JGProgressHUD(style: .dark)
	
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
		setupNavBar()
		fetchCoins()
		
		tableView.register(CryptoCell.self, forCellReuseIdentifier: "cellId")
	}
	
	func displayData(viewModel: Crypto.Model.ViewModel.ViewModelData) {
		switch viewModel {
		case .displayCrypto(cryptoViewModel: let cryptoViewModel):
			self.cryptoViewModel = cryptoViewModel
			DispatchQueue.main.async {
				self.tableView.reloadData()
				self.hud.dismiss(animated: true)
			}
			
		case .displayError(errorMessage: let errorMessage):
			self.errorAlert(errorMessage: errorMessage)
			hud.dismiss(animated: true)
		}
	}
	
	// MARK: - Fileprivate methods
	fileprivate func fetchCoins() {
		hud.textLabel.text = "Loading"
		hud.show(in: tableView)
		interactor?.makeRequest(request: .fetchCrypto)
	}
	
	fileprivate func errorAlert(errorMessage: String) {
		let alert = UIAlertController(title: "Oops. Something went wrong.", message: errorMessage, preferredStyle: .alert)
		let dismissAction = UIAlertAction(title: "OK", style: .destructive)
		
		alert.addAction(dismissAction)
		present(alert, animated: true)
	}
	
	fileprivate func setupNavBar() {
		title = "Coins"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(handleRefresh))
	}
	
	// MARK: - Objc fileprivate methods
	@objc fileprivate func handleRefresh() {
		hud.textLabel.text = "Loading"
		hud.show(in: view)
		interactor?.makeRequest(request: .fetchCrypto)
	}
	
	// MARK: - Table View Data Source
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cryptoViewModel.cells.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CryptoCell
		let cellViewModel = cryptoViewModel.cells[indexPath.row]
		cell.cellViewModel = cellViewModel
		return cell
	}
}
