//
//  HomeViewController.swift
//  Code-Challenge-Yape
//
//  Created by Alexander Ynoñan H. on 9/01/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var tblFood: UITableView! {
        didSet {
            tblFood.backgroundColor = .clear
            tblFood.keyboardDismissMode = .onDrag
        }
    }

    @IBOutlet private weak var foodSearch: UISearchBar! {
        didSet{
            UITextField.appearance(
                whenContainedInInstancesOf: [UISearchBar.self]
            ).textColor = .black
        }
    }

    private var homeModel: HomeModel!
    private var homeModelTable: HomeModelTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadHome()
        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard homeModel != nil else { return }
        homeModel.prepareModel(for: segue, sender: sender)
    }

}

extension HomeViewController {
    
    private func loadHome() {
        view.backgroundColor = .white
        homeModel = HomeModel(
            tableView: tblFood,
            toController: self,
            searchBar: foodSearch
        )

        homeModel.bindEmployeeViewModelToController = { [weak self] in            
            self?.loadTableView()
        }
    }

    private func loadTableView() {
        homeModelTable = HomeModelTableView(
            items: homeModel.arrayFoods,
            toController: self
        )
        tblFood.delegate = homeModelTable
        tblFood.dataSource = homeModelTable
        tblFood.reloadData()
    }
}
