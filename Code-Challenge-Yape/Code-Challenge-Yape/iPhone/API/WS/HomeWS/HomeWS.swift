//
//  HomeWS.swift
//  Code-Challenge-Yape
//
//  Created by Alexander Ynoñan H. on 10/01/23.
//

import UIKit

struct HomeWS {

    static let shared = HomeWS()
    
    private init() { }
    
    func getRecipe(
        completion: @escaping Closures.Home.SuccessFood,
        errorService: @escaping Closures.ErrorMessage
    ) {
        let endpoint = WebServicesURL.Home.homeSearchFood

        CSWebService.sharedInstace.requestType(
            type: .get,
            url: endpoint
        ) { response, status in
            CSWebService.sharedInstace.genericResponseData(response,statusCode: status, success: { json in
                    guard let data = json.array else { return }
                    completion(data.map({ FoodBE($0) }))
            }, error: errorService)
        }
    }
}
