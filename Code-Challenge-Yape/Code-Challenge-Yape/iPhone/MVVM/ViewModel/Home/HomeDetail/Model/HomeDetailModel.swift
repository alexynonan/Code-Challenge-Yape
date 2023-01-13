//
//  HomeDetailModel.swift
//  Code-Challenge-Yape
//
//  Created by Alexander Ynoñan H. on 10/01/23.
//

import UIKit

class HomeDetailModel: NSObject {

    private weak var controller: UIViewController?
    var successFood: Closures.HomeDetail.SuccessFood = { _ in }
    private var objFood: FoodBE!
    
    init(toController: UIViewController,obj: FoodBE) {
        super.init()
        controller = toController
        objFood = obj
    }
    
}

extension HomeDetailModel {

    func exitController() {
        controller?.navigationController?.popViewController(
            animated: true
        )
    }

    func selectMap(){
        controller?.performSegue(
            withIdentifier: Segues.mapsViewController,
            sender: objFood
        )
    }

    func loadFood() {
        DispatchQueue.main.async {
            self.successFood(self.objFood)
        }
    }
    
    func prepareModel(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? MapsViewController {
            guard let obj = sender as? FoodBE else { return }
            controller.didRecieveDataFood(objFood: obj)
        }
    }
}
