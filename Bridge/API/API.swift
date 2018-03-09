//
//  API.swift
//  Bridge
//
//  Created by Sajjad Aboutalebi on 3/9/18.
//  Copyright © 2018 Sajjad Aboutalebi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API {
    static let shared = API()
    
    private var BASEURL: String = "http://127.0.0.1:9191"
    
    
    
    func extract(_ url: String, completion: @escaping (_ entity: Entires) -> ()) {
        let parameters: Parameters = ["url": url, "flatten": "False"]
        Alamofire.request(BASEURL + "/api/info", parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print(json)
                completion(Entires(json))
            case .failure(let error):
                print(error)
            }
        }
    }
}
