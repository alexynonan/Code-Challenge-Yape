//
//  SplashModel.swift
//  Code-Challenge-Yape
//
//  Created by Alexander Ynoñan H. on 9/01/23.
//

import UIKit

class SplashModel: NSObject {

    private weak var controller: UIViewController?
    
    var succesSplashToController : Closures.Success = {}
    
    init(toController: UIViewController) {
        super.init()
        controller = toController
        self.toHomeController()
    }
}

extension SplashModel {

    private func toHomeController() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.succesSplashToController()
            self.controller?.performSegue(
                withIdentifier: Segues.homeViewController,
                sender: nil
            )
        }
    }
}

