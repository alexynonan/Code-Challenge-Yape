//
//  HomeModel.swift
//  Code-Challenge-Yape
//
//  Created by Alexander Ynoñan H. on 9/01/23.
//

import UIKit

class HomeModel: NSObject {

    private enum Constante {
        static let defaultNumber = 1
    }

    private(set) var arrayFoods: [FoodBE]!{
        didSet {
            bindEmployeeViewModelToController()
        }
    }
    
    private(set) var arrayFilterFoods: [FoodBE]!

    private weak var controller: UIViewController?
    private weak var tblFood: UITableView?

    var bindEmployeeViewModelToController : Closures.Success = {}
    var errorViewModelToContoller : Closures.ErrorMessage = { _ in }

    init(tableView: UITableView,toController: UIViewController,searchBar: UISearchBar) {
        super.init()
        tblFood = tableView
        controller = toController
        searchBar.delegate = self
        loadServices()
    }

}
//MARK: -SearchBar
extension HomeModel: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            arrayFoods = arrayFilterFoods
            
        } else {
            arrayFoods = arrayFilterFoods.filter({ item in
                let search = "\(item.name) \(item.description)".lowercased()
                return search.contains(searchText.lowercased())
            })
        }
    }
}

//MARK: -Methods
extension HomeModel {
    
    func loadServices() {

        let refreshControll = UIActivityIndicatorView(style: .medium)
        refreshControll.hidesWhenStopped = true
        refreshControll.startAnimating()
        tblFood?.tableFooterView = refreshControll

        HomeBL.shared.getRecipe { [weak self] foods in
            guard let self = self else { return }
            refreshControll.stopAnimating()
            self.arrayFilterFoods = foods
            self.arrayFoods = foods
        } errorService: { [weak self] errorMessage in
            guard let self = self else { return }
            refreshControll.stopAnimating()
            self.errorViewModelToContoller(errorMessage)
        }
    }

    func prepareModel(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? HomeDetailViewController {
            guard let obj = sender as? FoodBE else { return }
            controller.didRecieveDataFood(objFood: obj)
        }
    }
}
