//
//  MapsViewController.swift
//  Code-Challenge-Yape
//
//  Created by Alexander Ynoñan H. on 9/01/23.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController {

    @IBOutlet weak private var mapView : GMSMapView!
    @IBOutlet private weak var lblTitle: UILabel!

    private var mapModel: MapsModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        mapModel.loadModel(toMapView: mapView) { [weak self] message in
            self?.lblTitle.text = message
        }
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mapModel.ajustarZoomMapa()
    }

    @IBAction private func btnExit(_ sender : Any?) {
        mapModel.exitController()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func didRecieveDataFood(objFood: FoodBE) {        
        mapModel = MapsModel(
            toController: self,
            tofood: objFood
        )
    }
}
