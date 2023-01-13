//
//  FoodBE.swift
//  Code-Challenge-Yape
//
//  Created by Alexander Ynoñan H. on 10/01/23.
//

import SwiftyJSON

struct FoodBE {

    var name: String
    var description: String
    private var image: String
    var location: FoodLocationBE

    init(_ json: JSON? = nil) {
        self.name = json?.dictionary?["name"]?.stringValue ?? ""
        self.description = json?.dictionary?["description"]?.stringValue ?? ""
        self.image = json?.dictionary?["image"]?.stringValue ?? ""
        self.location = FoodLocationBE(json?.dictionary?["location"])
    }
    
    var urlImage : String {
        return WebServicesURL.baseURLImage + image
    }
}

struct FoodLocationBE {

    var lat: Double
    var long: Double

    init(_ json: JSON? = nil) {
        self.lat = Double(json?.dictionary?["lat"]?.stringValue ?? "") ?? 0.0
        self.long = Double(json?.dictionary?["long"]?.stringValue ?? "") ?? 0.0
    }
}
