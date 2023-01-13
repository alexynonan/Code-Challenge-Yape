//
//  HomeDetailViewController.swift
//  Code-Challenge-Yape
//
//  Created by Alexander Ynoñan H. on 10/01/23.
//

import UIKit

class HomeDetailViewController: UIViewController {

    private enum Constante {
        static let cornerRadius:CGFloat = 10
    }

    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblDescription: UILabel!
    @IBOutlet private weak var imgFood: UIImageView! {
        didSet {
            imgFood.backgroundColor = .clear
            imgFood.layer.cornerRadius = Constante.cornerRadius
            imgFood.contentMode = .scaleToFill
        }
    }
    @IBOutlet private weak var activityImgFood: UIActivityIndicatorView!
    
    private var homeDetailModel: HomeDetailModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        // Do any additional setup after loading the view.
    }

    func didRecieveDataFood(objFood: FoodBE) {
        self.homeDetailModel = HomeDetailModel(
            toController: self,
            obj: objFood
        )
    }

    @IBAction private func btnExit(_ sender : Any?) {
        homeDetailModel.exitController()
    }

    @IBAction private func btnSelectLocation(_ sender : Any?) {
        homeDetailModel.selectMap()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard homeDetailModel != nil else { return }
        homeDetailModel.prepareModel(for: segue, sender: sender)
    }

}

extension HomeDetailViewController {
    
    private func loadData() {
        homeDetailModel.loadFood()
        homeDetailModel.successFood = { [weak self] objFood in
            guard let self = self else { return }
            self.lblTitle.text = objFood.name
            self.lblDescription.text = objFood.description
            self.activityImgFood.startAnimating()
            self.imgFood.downloadImageView(url: objFood.urlImage) { [weak self] image in
                guard let self = self else { return }
                self.activityImgFood.stopAnimating()
                self.imgFood.image = image
            }
        }
    }


}
