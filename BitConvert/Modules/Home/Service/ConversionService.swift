//
//  ConversionService.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import Alamofire
import PromiseKit
import SwiftyJSON
class ConversionService {

    func convertBTCToCurrency(_ currency: Currency) -> Promise<String> {
        return Promise { seal in
            Alamofire.request("https://apiv2.bitcoinaverage.com/convert/global?from=BTC&to=\(currency.isoCurrency)&amount=1")
                .validate()
                .responseJSON { response in
                    
                    switch response.result {
                    case .success(let json):
                        let swiftyJsonVar = JSON(json)
                        seal.fulfill(swiftyJsonVar["price"].stringValue)
                    case .failure(let error):
                        seal.reject(error)
                    }
            }
        }
    }

}
