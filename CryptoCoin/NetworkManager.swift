//
//  NetworkManager.swift
//  CryptoCoin
//
//  Created by mogggiii on 16.04.2022.
//

import Foundation

final class NetworkManager {
	
	static let shared = NetworkManager()
	
	let url = "https://coinlib.io/api/v1/coinlist?key=2762e6e300acc1ae&pref=USD&page=1&order=volume_desc"
	
	private init () {}
	
	func coinResponse(with url: String, completionHandler: @escaping (Result<Coins, Error>) -> ()) {
		return self.codableTask(with: url, completion: completionHandler)
	}
	
	fileprivate func codableTask<T: Codable> (with url: String, completion: @escaping (Result<T, Error>) -> ()) {
		guard let url = URL(string: url) else { return }
		URLSession.shared.dataTask(with: url) { data, _, error in
			if let error = error {
				print("Error")
				completion(.failure(error))
				return
			}
			
			guard let data = data else { return }
			
			do {
				let cryptoCoins = try JSONDecoder().decode(T.self, from: data)
				completion(.success(cryptoCoins))
			} catch let error {
				print("Error", error.localizedDescription)
				completion(.failure(error))
			}
		} .resume()
	}
}



