//
//  FlickrPictureCVCell.swift
//  showoff test
//
//  Created by Yona Harel on 27/01/2022.
//

import UIKit
import Kingfisher

class FlickrPictureCVCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    static let reuseId = "FlickrPictureCVCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        // Initialization code
    }
    
    var photo: FlickrPhoto? {
        didSet {
            guard let photo = photo else {
                return
            }
            activityIndicator.startAnimating()
            if let url = URL(string: photo.url_s ?? ""){
                imageView.kf.setImage(with: url) { _ in
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                }
//                imageView.kf.setImage(with:)
            }
            
          
        
        }
    }

    
    
}
