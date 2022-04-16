//
//  Coins.swift
//  CryptoCoin
//
//  Created by mogggiii on 16.04.2022.
//

import Foundation

struct Coins: Codable {
	let coins: [Coin]
	let lastUpdatedTimestamp: Int
	let remaining: Int
	
	enum CodingKeys: String, CodingKey {
		case coins
		case lastUpdatedTimestamp = "last_updated_timestamp"
		case remaining
	}
}

struct Coin: Codable {
	let symbol: String
	let showSymbol: String
	let name: String
	let rank: Int
	let price: String
	let marketCap: String
	let volume24H: String
	let delta24H: String
	
	enum CodingKeys: String, CodingKey {
		case symbol
		case showSymbol = "show_symbol"
		case name, rank, price
		case marketCap = "market_cap"
		case volume24H = "volume_24h"
		case delta24H = "delta_24h"
	}
}
