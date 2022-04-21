//
//  CryptoModels.swift
//  CryptoCoin
//
//  Created by mogggiii on 22.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Crypto {
   
  enum Model {
    struct Request {
      enum RequestType {
        case fetchCrypto
      }
    }
    struct Response {
      enum ResponseType {
				case presentCrypto(response: Coins)
      }
    }
    struct ViewModel {
      enum ViewModelData {
				case displayCrypto(cryptoViewModel: CryptoViewModel)
      }
    }
  }
  
}

class CryptoViewModel {
	class Cell {
		let name: String
		let price: String
		let delta24H: String
		
		init(name: String, price: String, delta24H: String) {
			self.name = name
			self.price = price
			self.delta24H = delta24H
		}
	}
	
	let cells: [Cell]
	init(cells: [Cell]) {
		self.cells = cells
	}
}
