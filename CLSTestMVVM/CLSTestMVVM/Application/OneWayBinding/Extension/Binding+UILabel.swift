//
//  Binding+UILabel.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 18/04/2018.
//  Copyright © 2018 StephenChen. All rights reserved.
//

import UIKit

protocol BindableProtocol {
    associatedtype BindingType
    var bindingWith: Bond<BindingType> { get }
}

extension UILabel: BindableProtocol {
    typealias BindingType = String

    var bindingWith: Bond<String> {
        var handle: UInt8 = 0;
        if let bond = objc_getAssociatedObject(self, &handle) as? Bond<String> {
            return bond
        } else {
            let bond = Bond<String>() { [unowned self] value in
                self.text = value
            }
            objc_setAssociatedObject(self, &handle, bond, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return bond
        }
    }
}


