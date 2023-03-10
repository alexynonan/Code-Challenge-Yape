//
//  Closures.swift
//  Code-Challenge-Yape
//
//  Created by Alexander Ynoñan H. on 9/01/23.
//

import SwiftyJSON

struct Closures {

    //MARK: General
    typealias ErrorMessage = (_ errorMessage: String) -> Void
    typealias Message = (_ message: String) -> Void
    typealias Success = () -> Void
    typealias Image = (_ image: UIImage)   -> Void

    //MARK: WebServices
    typealias SuccessResponse = (_ response: JSON,_ status: Int) -> Void
    typealias FailureResponse = (_ errorMessage: String) -> Void

    struct Home {
        typealias SuccessFood = (_ foods: [FoodBE]) -> Void
    }
    struct HomeDetail {
        typealias SuccessFood = (_ food: FoodBE) -> Void
    }
}
