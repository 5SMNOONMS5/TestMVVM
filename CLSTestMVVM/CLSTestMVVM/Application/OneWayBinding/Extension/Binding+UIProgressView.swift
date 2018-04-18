//
//  Binding+UIProgressView.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 18/04/2018.
//  Copyright © 2018 StephenChen. All rights reserved.
//

import UIKit
import Foundation

extension UIProgressView: BindableProtocol {
    typealias BindingType = Float
    
    var bindingWith: Bond<Float> {
        var handle: UInt8 = 0;
        if let bond = objc_getAssociatedObject(self, &handle) as? Bond<Float> {
            return bond
        } else {
            let bond = Bond<Float>() { [unowned self] value in
                self.progress = value
            }
            objc_setAssociatedObject(self, &handle, bond, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return bond
        }
    }
}

