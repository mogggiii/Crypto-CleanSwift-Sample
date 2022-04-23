//
//  CryptoPresenter.swift
//  CryptoCoin
//
//  Created by mogggiii on 22.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CryptoPresentationLogic {
  func presentData(response: Crypto.Model.Response.ResponseType)
}

class CryptoPresenter: CryptoPresentationLogic {
  weak var viewController: CryptoDisplayLogic?
  
  func presentData(response: Crypto.Model.Response.ResponseType) {
		switch response {
		case .presentCrypto(response: let response):
			let cells = response.coins.map { coin in
				cellViewModel(for: coin)
			}
			
			let cryptoViewModel = CryptoViewModel.init(cells: cells)
			viewController?.displayData(viewModel: Crypto.Model.ViewModel.ViewModelData.displayCrypto(cryptoViewModel: cryptoViewModel))
		case .presentError(error: let error):
			print(error.localizedDescription)
			let message = "The request timed out."
			viewController?.displayData(viewModel: .displayError(errorMessage: message))
		}
  }
  
	private func cellViewModel(for coin: Coin) -> CryptoViewModel.Cell {
		return CryptoViewModel.Cell.init(name: coin.name, price: coin.price, delta24H: coin.delta24H, symbol: coin.symbol)
	}
}
