//
//  KDetailViewController.swift
//  KEntertainmentMain
//
//  Created by Javier Bolaños on 12/30/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit
import KEntertainmentDomain

class KDetailViewController: GHBaseViewController {

    @IBOutlet weak var gradiantview: UIView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .white
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var upcomingLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    private var model: ModelCollectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setGradientBackground()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.helperControllerManager?.setNavBarHiden(hidden: false)
        self.helperControllerManager?.setLightStile()
        
        self.model = self.bundle?.get("kmodel")
        
        if let movieModel = self.model as? KMovieModel {
            self.makeMovieData(model: movieModel)
        }
        else if let tvModel = self.model as? KTvModel {
            self.makeTvData(model: tvModel)
        }
    }
    
    func setGradientBackground() {
        let colorTop = UIColor.clear.cgColor
        let colorBottom = UIColor.black.cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.gradiantview.layer.insertSublayer(gradientLayer, at:0)
    }
    
    private func makeMovieData(model: KMovieModel) {
        self.backImageView.image = model.cacheData as? UIImage
        self.titleLabel.text = model.title
        self.descriptionLabel.text = model.overview
        
        self.upcomingLabel.text = model.releaseDate
        self.rateLabel.text = String(model.voteAverage)
        self.languageLabel.text = model.originalLanguage.uppercased()
        self.setMovieImage(model: model)
    }
    
    private func makeTvData(model: KTvModel) {
        self.backImageView.image = model.cacheData as? UIImage
        self.titleLabel.text = model.name
        self.descriptionLabel.text =  model.overview
        
        self.upcomingLabel.text = model.firstAirDate
        self.rateLabel.text = String(model.voteAverage)
        self.languageLabel.text = model.originalLanguage.uppercased()
        self.setTvImage(model: model)
    }
}

extension KDetailViewController {
    public func setMovieImage(model: KMovieModel) {
        CacheImageRow.shared.setImageCahce(key: model.posterPath, imageView: self.backImageView)
    }
}

extension KDetailViewController {
    public func setTvImage(model: KTvModel) {
        CacheImageRow.shared.setImageCahce(key: model.posterPath, imageView: self.backImageView)
        
    }
}
