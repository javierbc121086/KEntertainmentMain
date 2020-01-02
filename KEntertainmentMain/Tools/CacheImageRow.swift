//
//  CacheImageRow.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/30/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit
import GNNetworkServices
import RPEntertainmentData

final class CacheImageRow {
    static let shared = CacheImageRow()
    private init() { }
    var dict = [String: UIImage]()
    
    public func setImageCahce(key: String, imageView: UIImageView) {
        imageView.image = nil
        
        if let image = CacheImageRow.shared.dict[key] {
            imageView.image = image
            return
        }
        
        if !GNDependencySeriveConfig.getStatusNetwork() {
            let storageImage = KDataWrapper.shared.fetchImage(imageName: key)
            CacheImageRow.shared.dict.updateValue(storageImage ?? UIImage(), forKey: key)
            imageView.image = storageImage
            return
        }
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(key)") else {
            CacheImageRow.shared.dict.updateValue(UIImage(), forKey: key)
            imageView.image = UIImage()
            return
        }
        
        let config = URLSessionConfiguration.default
        let task = URLSession(configuration: config).dataTask(with: url, completionHandler:
                    { (data: Data?, response: URLResponse?, error: Error?) in
                              
                        DispatchQueue.main.async(execute: {
                            if let _ = error {
                                CacheImageRow.shared.dict.updateValue(UIImage(), forKey: key)
                                return
                            }
                            
                            if let dt = data, let remoteImage = UIImage(data: dt) {
                                CacheImageRow.shared.dict.updateValue(remoteImage, forKey: key)
                                KDataWrapper.shared.deleteImage(imageName: key)
                                _ = KDataWrapper.shared.saveImage(image: remoteImage, name: key)
                                imageView.image = remoteImage
                            }
                        })
                    })
                          
        task.resume()
    }
}
