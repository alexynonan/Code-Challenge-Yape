//
//  HomeFoodTableViewCell.swift
//  Code-Challenge-Yape
//
//  Created by Alexander Ynoñan H. on 10/01/23.
//

import UIKit

class HomeFoodTableViewCell: UITableViewCell {

    private enum Constante {
        static let cornerRadius: CGFloat = 10
    }

    @IBOutlet weak private var lblName: UILabel!
    @IBOutlet weak private var imgFood: UIImageView! {
        didSet {
            imgFood.backgroundColor = .clear
            imgFood.layer.cornerRadius = Constante.cornerRadius
        }
    }

    @IBOutlet weak private var activityImgaeFood: UIActivityIndicatorView!

    var objFood: FoodBE! {
        didSet {
            lblName.text = objFood.name
            activityImgaeFood.startAnimating()
            imgFood.downloadImageView(url: objFood.urlImage) { [weak self] image in
                self?.activityImgaeFood.stopAnimating()
                self?.imgFood.image = image
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
