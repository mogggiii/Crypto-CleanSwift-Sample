//
//  CryptoInteractor.swift
//  CryptoCoin
//
//  Created by mogggiii on 22.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CryptoBusinessLogic {
	func makeRequest(request: Crypto.Model.Request.RequestType)
}

class CryptoInteractor: CryptoBusinessLogic {
	
	var presenter: CryptoPresentationLogic?
	var service: CryptoService?
	
	func makeRequest(request: Crypto.Model.Request.RequestType) {
		if service == nil {
			service = CryptoService()
		}
		
		switch request {
		case .fetchCrypto:
			service?.fetchCrypto(completion: { result in
				switch result {
				case .success(let coins):
					guard let coins = coins else { return }
					self.presenter?.presentData(response: .presentCrypto(response: coins))
				case .failure(let error):
					self.presenter?.presentData(response: .presentError(error: error))
					print(error)
				}
			})
		}
	}
	
}
