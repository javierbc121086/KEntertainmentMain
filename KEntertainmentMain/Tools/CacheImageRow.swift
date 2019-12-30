//
//  CacheImageRow.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/30/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

final class CacheImageRow {
    static let shared = CacheImageRow()
    private init() { }
    var dict = [String: UIImage]()
    
    public func setImageCahce(urlPath: URL?, key: String, imageView: UIImageView) {
        if let image = CacheImageRow.shared.dict[key] {
            imageView.image = image
        }
        
        guard let url = urlPath else {
            CacheImageRow.shared.dict.updateValue(UIImage(), forKey: key)
            imageView.image = UIImage()
            return
        }
        
        let config = URLSessionConfiguration.default
        let task = URLSession(configuration: config).dataTask(with: url, completionHandler:
                    { (data: Data?, response: URLResponse?, error: Error?) in
                              
                        DispatchQueue.main.async(execute: {
                            if let dt = data, let remoteImage = UIImage(data: dt) {
                                CacheImageRow.shared.dict.updateValue(remoteImage, forKey: key)
                                imageView.image = remoteImage
                            }
                        })
                    })
                          
        task.resume()
    }
}
