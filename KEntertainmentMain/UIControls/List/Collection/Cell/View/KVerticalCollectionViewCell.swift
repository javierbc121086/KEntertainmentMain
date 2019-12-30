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
        CacheImageRow.shared.setImageCahce(urlPath: URL(string: "https://image.tmdb.org/t/p/w500\(model.posterPath)"),
                                           key: "https://image.tmdb.org/t/p/w500\(model.posterPath)", imageView: self.posterImageView)
    }
}

extension KVerticalCollectionViewCell {
    public func setTvImage(model: KTvModel) {
        CacheImageRow.shared.setImageCahce(urlPath: URL(string: "https://image.tmdb.org/t/p/w500\(model.posterPath)"),
                                           key: "https://image.tmdb.org/t/p/w500\(model.posterPath)", imageView: self.posterImageView)
    }
}
