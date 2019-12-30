//
//  DateCollectionViewController.swift
//  Generic
//
//  Created by Javier Bolaños on 10/14/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import UIKit

protocol GenericCollectionViewControllerDelegate {
    func modelSelected(model: ModelCollectionDelegate)
}

class GenericCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    fileprivate var flowLayout: UICollectionViewFlowLayout?
    
    private lazy var list: [ModelCollectionDelegate]? = []
    private lazy var rowSelectable = false
    private lazy var initialScrollDone = false
    
    var collectionDelegate: GenericCollectionViewControllerDelegate?
    
    required init(direction: UICollectionView.ScrollDirection? = nil) {
        self.flowLayout = UICollectionViewFlowLayout()
        self.flowLayout?.scrollDirection = direction ?? .horizontal
        super.init(collectionViewLayout: self.flowLayout!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionCellType.getList.forEach { element in
            let nib = UINib(nibName: element, bundle: nil)
            self.collectionView?.register(nib, forCellWithReuseIdentifier: element)
        }
        
        self.collectionView?.backgroundColor = .clear
        
        self.collectionView.clipsToBounds = true
        
        self.collectionView?.isUserInteractionEnabled = true
        self.collectionView?.alwaysBounceVertical = false
        self.collectionView?.alwaysBounceHorizontal = false
        
        self.collectionView?.bounces = true
        
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.collectionView?.showsVerticalScrollIndicator = false
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return self.list?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: CollectionViewCellDelegate?
        
        if let data = self.list?[indexPath.row] {
            cell = data.collectionView(collectionView: collectionView, cellForItemAt: indexPath)
            cell?.drawCell(model: data)
        }
        
        guard let collectionCell = cell as? UICollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return collectionCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        
        if let data = self.list?[indexPath.row] {
            self.collectionDelegate?.modelSelected(model: data)
        }
    }
    
    //MARK: Delegate Flow Layout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let data = self.list?[indexPath.row] {
            return data.SizeForItem
        }
        
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 18.0
    }
    
    /**
     FOOTER VIEW INDICATOR
     */
    func setSource(list: [ModelCollectionDelegate]) {
        self.list?.removeAll()
        self.list = nil
        self.list = list
        self.collectionView?.reloadData()
    }
}
