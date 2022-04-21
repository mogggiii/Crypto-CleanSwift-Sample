//
//  CryptoPresenter.swift
//  CryptoCoin
//
//  Created by mogggiii on 21.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CryptoPresentationLogic {
  func presentData(response: Crypto.Model.Response.ResponseType)
}

class CryptoPresenter: CryptoPresentationLogic {
  
  weak var viewController: CryptoDisplayLogic?
  
  func presentData(response: Crypto.Model.Response.ResponseType) {

  }
  
}
