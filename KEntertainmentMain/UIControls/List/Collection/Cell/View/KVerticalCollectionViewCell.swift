//
//  KVerticalCollectionViewCell.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/30/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit
import KEntertainmentDomain

class KVerticalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateImageView: UIImageView!
    @IBOutlet weak var rateAverageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.rateImageView.image = #imageLiteral(resourceName: "rate")
        self.posterImageView.layer.cornerRadius = 10
        self.rateAverageLabel.textColor = .pinkyRed
        self.titleLabel.textColor = .titleBlack
    }
}

extension KVerticalCollectionViewCell: CollectionViewCellDelegate {
    func drawCell(model: ModelCollectionDelegate) {
        self.posterImageView.image = nil
        
        if let movie = model as? KMovieModel {
            self.setMovieData(movie)
        }
        else if let tv = model as? KTvModel {
            self.setTvData(tv)
        }
    }
    
    private func setMovieData(_ movie: KMovieModel) {
        self.titleLabel.text = movie.title
        self.rateAverageLabel.text = String(movie.voteAverage)
        self.setMovieImage(model: movie)
    }
    
    private func setTvData(_ tv: KTvModel) {
        self.titleLabel.text = tv.name
        self.rateAverageLabel.text = String(tv.voteAverage)
        self.setTvImage(model: tv)
    }
}

extension KVerticalCollectionViewCell {
    public func setMovieImage(model: KMovieModel) {
        if !model.isVerified {
            if model.posterPath.isNotEmpty {
                if let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.posterPath)") {
                    let config = URLSessionConfiguration.default
                    
                    let task = URLSession(configuration: config).dataTask(with: url, completionHandler:
                    { (data: Data?, response: URLResponse?, error: Error?) in
                        
                        DispatchQueue.main.async(execute: {
                            if let _ = error {
                                self.setMovieDataToImage(data: model, verified: true, image: nil)
                                return
                            }
                            
                            if let dt = data {
                                if let image = UIImage(data: dt) {
                                    DispatchQueue.main.async(execute: {
                                        self.setMovieDataToImage(data: model, verified: true, image: image)
                                    })
                                }
                            }
                        })
                    })
                    
                    task.resume()
                }
            }
            else {
                self.setMovieDataToImage(data: model, verified: true, image: nil)
            }
        }
        else {
            if let img = model.PosterImage {
                self.posterImageView.image = nil
                self.posterImageView.image = img
            }
            else {
                self.posterImageView.image = nil
                self.posterImageView.image = UIImage()
            }
        }
    }
    
    private func setMovieDataToImage(data: KMovieModel, verified: Bool, image: UIImage?) {
        var dt = data
        dt.isVerified = verified
        self.posterImageView.image = nil
        self.posterImageView.image = image ?? UIImage()
    }
}

extension KVerticalCollectionViewCell {
    public func setTvImage(model: KTvModel) {
        if !model.isVerified {
            if model.posterPath.isNotEmpty {
                if let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.posterPath)") {
                    let config = URLSessionConfiguration.default
                    
                    let task = URLSession(configuration: config).dataTask(with: url, completionHandler:
                    { (data: Data?, response: URLResponse?, error: Error?) in
                        
                        DispatchQueue.main.async(execute: {
                            if let _ = error {
                                self.setTvDataToImage(data: model, verified: true, image: nil)
                                return
                            }
                            
                            if let dt = data {
                                if let image = UIImage(data: dt) {
                                    DispatchQueue.main.async(execute: {
                                        self.setTvDataToImage(data: model, verified: true, image: image)
                                    })
                                }
                            }
                        })
                    })
                    
                    task.resume()
                }
            }
            else {
                self.setTvDataToImage(data: model, verified: true, image: nil)
            }
        }
        else {
            if let img = model.PosterImage {
                self.posterImageView.image = nil
                self.posterImageView.image = img
            }
            else {
                self.posterImageView.image = nil
                self.posterImageView.image = UIImage()
            }
        }
    }
    
    private func setTvDataToImage(data: KTvModel, verified: Bool, image: UIImage?) {
        var dt = data
        dt.isVerified = verified
        self.posterImageView.image = nil
        self.posterImageView.image = image ?? UIImage()
    }
}
