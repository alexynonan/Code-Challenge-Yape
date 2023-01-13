//
//  HomeModelTableView.swift
//  Code-Challenge-Yape
//
//  Created by Alexander Ynoñan H. on 10/01/23.
//

import UIKit

class HomeModelTableView: NSObject {

    private var arrayFoods: [FoodBE]!
    private weak var controller: UIViewController!

    init(items : [FoodBE],toController: UIViewController) {
        super.init()
        arrayFoods = items
        controller = toController
    }

}

extension HomeModelTableView : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFoods.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "HomeFoodTableViewCell",
            for: indexPath) as! HomeFoodTableViewCell
        cell.objFood = self.arrayFoods[indexPath.row]
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let _ = tableView.cellForRow(
            at: indexPath
        ) as? HomeFoodTableViewCell else {
            return
        }
        controller.performSegue(
            withIdentifier: Segues.homeDetailViewController,
            sender: arrayFoods[indexPath.row]
        )
    }
}
