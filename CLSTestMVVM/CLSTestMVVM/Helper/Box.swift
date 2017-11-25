//
//  Box.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 18/11/2017.
//  Copyright © 2017 StephenChen. All rights reserved.
//

import Foundation

class Bindingable<T> {
    
    typealias Listener = (T) -> Void
    
    var listener: Listener?

    var value: T {
        didSet {

        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}

