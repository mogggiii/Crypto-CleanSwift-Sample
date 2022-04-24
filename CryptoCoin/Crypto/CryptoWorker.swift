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
		fetchGenericData(url: url, completion: completion)
	}
	
	fileprivate func fetchGenericData<T: Decodable>(url: String, completion: @escaping (Result<T?, Error>) -> ()) {
		guard let url = URL(string: url) else { return }
		AF.request(url).responseDecodable(of: T.self) { response in
			switch response.result {
			case .success(let data):
				completion(.success(data))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
}


