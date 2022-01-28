//
//  ShowPhotoVC.swift
//  showoff test
//
//  Created by Yona Harel on 28/01/2022.
//

import UIKit
import Kingfisher

class ShowPhotoVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPhoto()
    
    }
    
    var photo: FlickrPhoto!
    
    //downloading the flickr image
    func loadPhoto() {
        self.title = self.photo.title
        if let url = URL(string: photo.url_s ?? ""){
            imageView.kf.setImage(with: url)
        }
    }
    
    
}
