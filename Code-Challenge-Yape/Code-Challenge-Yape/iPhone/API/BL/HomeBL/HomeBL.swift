//
//  HomeBL.swift
//  Code-Challenge-Yape
//
//  Created by Alexander Ynoñan H. on 10/01/23.
//

struct HomeBL {

    static let shared = HomeBL()

    private init() { }

    func getRecipe(
        completion: @escaping Closures.Home.SuccessFood,
        errorService: @escaping Closures.ErrorMessage
    ) {

        HomeWS.shared.getRecipe(
            completion: completion,
            errorService: errorService
        )
    }
}
