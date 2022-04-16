//
//  ViewController.swift
//  CryptoCoin
//
//  Created by mogggiii on 15.04.2022.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .red
		
		NetworkManager.shared.coinResponse(with: NetworkManager.shared.url) { result in
			switch result {
			case .success(let coins):
				print(coins.coins.count)
				print(coins.coins[50].name)
				print(coins.coins[50].delta24H)
			case .failure(let error):
				print("Govno")
			}
		}
	}
}

