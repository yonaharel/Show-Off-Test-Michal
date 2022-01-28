//
//  ConfigurationUtils.swift
//  showoff test
//
//  Created by Yona Harel on 27/01/2022.
//

import Foundation
import Combine

class FlickrAPI {
    static let flickrAPIKey: String = "aabca25d8cd75f676d3a74a72dcebf21"
    static let initialPath: String = "https://www.flickr.com/services/rest/"
    static func getData(for method: FlickrAPIMethod) -> AnyPublisher<FlickrResponse, Error> {
        let components = method.createURLQuery()
        guard let url = components?.url else {
            return Future { promise in
                let error = NSError(domain: "URL is not supported", code: 500, userInfo: nil)
                promise(.failure(error))
            }.eraseToAnyPublisher()
        }
        
        let request = URLRequest(url: url)
        let client = HTTPClient(session: URLSession.shared)
        return client.perform(request)
    }
    
    /** returns query with default initial parameters */
    static func getFlickrURLComponent() -> URLComponents? {
        var url = URLComponents(string: initialPath)
        let queryItems: [URLQueryItem] = [
            .init(name: "api_key", value: flickrAPIKey),
            .init(name: "format", value: "json"),
            .init(name: "nojsoncallback", value: "1"),
            .init(name: "extras", value: "url_s")
        ]
        url?.queryItems = queryItems
        return url
    }
    
}

/** These API enums are useful if you want to add more methods with little code.
 the enums could carry payload to add up for the request
 */
enum FlickrAPIMethod {
    case getRecent(params: [String: String])
    
    var methodName: String {
        switch self {
        case .getRecent:
            return "flickr.photos.getRecent"
        }
    }
    /**
     Creates a URL query and adds parameters from enums payload if necessary
     */
    func createURLQuery() -> URLComponents? {
        var url = FlickrAPI.getFlickrURLComponent()
        var queryItems = [URLQueryItem(name: "method", value: self.methodName)]
        
        switch self {
        case .getRecent(let params):
            let additionalItems = params.map{ URLQueryItem(name: $0.key, value: $0.value)}
            queryItems.append(contentsOf: additionalItems)
        }
        url?.queryItems?.append(contentsOf: queryItems)
        return url
        
    }
}
