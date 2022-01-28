//
//  FlickerWrapper.swift
//  showoff test
//
//  Created by Yona Harel on 28/01/2022.
//

import Foundation


struct FlickrResponse: Codable {
    var photos: FlickrPhotoResponse?
}

struct FlickrPhotoResponse : Codable {
    var page: Int?
    var pages: Int?
    var perpage: Int?
    var total: Int?
    var photo: [FlickrPhoto]?
}

struct FlickrPhoto: Codable {
    var id: String?
    var title: String?
    var url_s: String?
}
