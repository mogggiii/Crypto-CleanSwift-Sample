//
//  CryptoWorker.swift
//  CryptoCoin
//
//  Created by mogggiii on 22.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

class CryptoService {
	
	func fetchCrypto(completion: @escaping (Result<Coins?, Error>) -> ()) {
		let url = "https://coinlib.io/api/v1/coinlist?key=2762e6e300acc1ae&pref=USD&page=1&order=volume_desc"
		
		AF.request(url).responseDecodable(of: Coins.self) { response in
			switch response.result {
			case .success(let data):
				print(data.coins.count)
				completion(.success(data))
			case .failure(let error):
				print("NIL")
				completion(.failure(error))
			}
		}
	}
}
