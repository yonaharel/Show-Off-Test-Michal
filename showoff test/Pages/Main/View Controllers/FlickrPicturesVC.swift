//
//  ViewController.swift
//  showoff test
//
//  Created by Yona Harel on 27/01/2022.
//

import UIKit
import Combine

class FlickrPicturesVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var viewModel = FlickrPicturesVM()
    var photoToShow: FlickrPhoto?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.setupSubscribers()
    }
    
    func setup() {
        self.title = "Recent  Photos"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: FlickrPictureCVCell.reuseId, bundle: nil), forCellWithReuseIdentifier: FlickrPictureCVCell.reuseId)
        collectionView.reloadData()
        activityIndicator.startAnimating()
    }
    func setupSubscribers() {
        viewModel.$reloadData.receive(on: DispatchQueue.main)
            .compactMap{ $0 }
            .sink { [weak self] refresh in
                if refresh {
                    self?.collectionView.reloadData()
                    self?.loadingView.isHidden = true
                }
            }.store(in: &viewModel.subscribers)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ShowPhotoVC {
            vc.photo = photoToShow
        }
    }
}

//MARK: - Collection View Delegate & Data Source
extension FlickrPicturesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlickrPictureCVCell.reuseId, for: indexPath) as! FlickrPictureCVCell
        cell.photo = viewModel.photos[indexPath.row]
        //pagination -- loading the next page
        viewModel.getPhotosForNextPage(photoId: cell.photo?.id)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (indexPath.row == viewModel.photos.count - 1), viewModel.isLoading {
            //it's the last cell
            //if the view model is still downloading photos - show the loader
            loadingView.isHidden = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        photoToShow = viewModel.photos[indexPath.row]
        performSegue(withIdentifier: "showPhotoSegue", sender: self)
    }
    
}

//MARK: - Collection View Layout
extension FlickrPicturesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4)
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        layout.invalidateLayout()
        var width = self.view.frame.width / 2 - 6
        let orientation = UIDevice.current.orientation
        if orientation.isLandscape {
            width = self.view.frame.width / 3 - 6
        }
        return CGSize(width: width, height: width)
       
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.reloadData()
    }
    
}
