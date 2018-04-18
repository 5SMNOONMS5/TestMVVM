//
//  CLSAnimationScrollCollectionVC.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 17/12/2017.
//  Copyright © 2017 StephenChen. All rights reserved.
//

import UIKit

/*
 * 此篇對我來說是區分 view logic 跟 data logic，我會把 view logic 寫在 這邊，然後資料的邏輯寫在 viewModel 裡面。
 */
class CLSAnimationScrollCollectionVC: UICollectionViewController {
    
    fileprivate var viewModel: CLSAnimationScrollViewModel = CLSAnimationScrollViewModel()
    
    fileprivate var fullScreenSize: CGSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializationCollectionView()
    }
    
    func initializationCollectionView(){
        self.collectionView?.alwaysBounceVertical = true
        self.collectionView?.register(UINib(nibName: "CLSAnimationScrollCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CLSAnimationScrollCollectionViewCell.className)
        
        self.collectionView?.backgroundColor = UIColor.black
        self.collectionView?.decelerationRate = UIScrollViewDecelerationRateFast
        
        let layout = CLSCollectionLayout(expandHeight: Constant.expandHeight, collapsedHeight: Constant.collapsedHegiht)
        self.collectionView?.setCollectionViewLayout(layout, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CLSAnimationScrollCollectionVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("collectionView collectionViewLayout")
        let height = (indexPath.row == 0) ? Constant.expandHeight : Constant.collapsedHegiht
        return CGSize(width: collectionView.frame.width, height: height)
    }
}

// MARK: - UICollectionViewDelegate
extension CLSAnimationScrollCollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
}

// MARK: - UICollectionViewDataSource
extension CLSAnimationScrollCollectionVC {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewModel.numberOfSection()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfItemInSections()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CLSAnimationScrollCollectionViewCell.className, for: indexPath as IndexPath) as! CLSAnimationScrollCollectionViewCell
        cell.setTitle(text: self.viewModel.getTitle(index: indexPath))
        cell.setBackgroundImage(imageName: self.viewModel.getImageName(index: indexPath))
        return cell
    }
}



