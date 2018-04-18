//
//  Extension+Helper.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 18/04/2018.
//  Copyright © 2018 StephenChen. All rights reserved.
//

import Foundation

public extension NSObject {
    
    /// Get class name
    ///
    /// EX:
    ///
    /// ```swift
    /// MyClass.className   //=> "MyClass"
    /// ```
    class var className: String {
        return String(describing: self)
    }
}

