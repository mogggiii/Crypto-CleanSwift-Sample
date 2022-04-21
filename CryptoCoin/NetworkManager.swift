//
//  NetworkManager.swift
//  CryptoCoin
//
//  Created by mogggiii on 16.04.2022.
//

import Foundation
import Alamofire

final class NetworkManager {
	
	static let shared = NetworkManager()
	
	private init () {}
	
	func fetchCrypto(completion: @escaping (Coins?) -> ()) {
		let url = "https://coinlib.io/api/v1/coinlist?key=2762e6e300acc1ae&pref=USD&page=1&order=volume_desc"
		
		AF.request(url).responseDecodable(of: Coins.self) { response in
			switch response.result {
			case .success(let data):
				print(data.coins.count)
				completion(data)
			case .failure(let error):
				print("NIL")
				completion(nil)
			}
		}
			
		}
	}
	

