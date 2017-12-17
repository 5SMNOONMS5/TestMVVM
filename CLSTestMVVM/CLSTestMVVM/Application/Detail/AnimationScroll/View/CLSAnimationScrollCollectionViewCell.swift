//
//  CLSAnimationScrollCollectionViewCell.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 17/12/2017.
//  Copyright © 2017 StephenChen. All rights reserved.
//

import UIKit

struct Constant {
    static let expandHeight: CGFloat = 280
    static let collapsedHegiht: CGFloat = 100
    static let minAlpha: CGFloat = 0.3
    static let maxAlpha: CGFloat = 0.75
}

class CLSAnimationScrollCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var alphaView: UIView!
    
    public func setTitle(text: String) -> Void {
        self.title.text = text
    }
    
    public func setBackgroundImage(imageName: String) {
        self.bgImage.image = UIImage(named: imageName)
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        let originHeight: CGFloat = Constant.expandHeight
        let shrinkHegiht: CGFloat = Constant.collapsedHegiht

        let proportion = 1 - (originHeight - frame.height) / (originHeight - shrinkHegiht)

        let minAlpha: CGFloat = Constant.minAlpha
        let maxAlpha: CGFloat = Constant.maxAlpha
        
        let alpha = maxAlpha - (proportion * (maxAlpha - minAlpha))
        self.alphaView.alpha = alpha

        let scale = max(proportion, 0.5)
        self.title.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
}
