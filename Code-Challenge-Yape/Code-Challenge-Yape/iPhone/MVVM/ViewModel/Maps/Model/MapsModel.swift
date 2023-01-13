//
//  MapsModel.swift
//  Code-Challenge-Yape
//
//  Created by Alexander Ynoñan H. on 10/01/23.
//

import UIKit
import GoogleMaps

class MapsModel: NSObject {

    private weak var controller: UIViewController?
    private weak var mapView: GMSMapView?
    private var objFood: FoodBE!
    
    var succesSplashToController : Closures.Success = {}

    init(toController: UIViewController,tofood: FoodBE) {
        super.init()
        controller = toController
        objFood = tofood
    }
}

extension MapsModel: GMSMapViewDelegate {

    func loadModel(toMapView: GMSMapView, completion: Closures.Message) {
        mapView = toMapView

        mapView?.delegate = self

        let objMarker = GMSMarker()

        objMarker.position = CLLocationCoordinate2DMake(
            objFood.location.lat,
            objFood.location.long
        )
        objMarker.icon = #imageLiteral(resourceName: "ic_location_food")
        objMarker.map = mapView
        completion(objFood.name)
    }

    func ajustarZoomMapa(){
        let camera = GMSCameraPosition.camera(
            withLatitude: objFood.location.lat,
            longitude: objFood.location.long,
            zoom: 15.0
        )
        mapView?.camera = camera
    }

    func exitController() {
        controller?.navigationController?.popViewController(
            animated: true
        )
    }
}
