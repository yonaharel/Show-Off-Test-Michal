//
//  FlickrPicturesVM.swift
//  showoff test
//
//  Created by Yona Harel on 27/01/2022.
//

import Foundation
import UIKit
import Combine

class FlickrPicturesVM {
    @Published var reloadData: Bool?
    @Published var photos: [FlickrPhoto] = []
    var isLoading: Bool = false
    var pageNumber = 1
    var photosPerPage = 30
    var lastPhotoId: String = ""
    var subscribers = Set<AnyCancellable>()
    
    init() {
        getRecentPhotos()
    }
    
    func getRecentPhotos(photosPerPage: Int = 20, pageNumber: Int = 1){
        let params = ["per_page" : "\(photosPerPage)",
                      "page": "\(pageNumber)"]
        isLoading = true
        FlickrAPI.getData(for: .getRecent(params: params)).sink { (completion) in
            switch completion {
            case .finished:
                print("photos downloaded")
            case .failure(let error):
                print(error)
            }
            
        } receiveValue: { [weak self] response in
            guard let weakSelf = self else { return }
            weakSelf.photos += response.photos?.photo ?? []
            //Updating page and last photo id
            weakSelf.pageNumber += 1
            weakSelf.lastPhotoId = weakSelf.photos[weakSelf.photos.endIndex - 16].id ?? ""
            weakSelf.reloadData = true
            weakSelf.isLoading = false
        }.store(in: &subscribers)

    }
    func getPhotosForNextPage(photoId: String?){
        //checking if current photo is the 15th from the end and if true, loading the next page
        if photoId == lastPhotoId {
            getRecentPhotos(photosPerPage: photosPerPage, pageNumber: pageNumber)
        }
    }
}
