//
//  CryptoRouter.swift
//  CryptoCoin
//
//  Created by mogggiii on 21.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CryptoRoutingLogic {

}

protocol CryptoDataPassing {
  var dataStore: CryptoDataStore? { get }
}

class CryptoRouter: NSObject, CryptoRoutingLogic {

  weak var viewController: CryptoViewController?
  
  // MARK: Routing
  
}
