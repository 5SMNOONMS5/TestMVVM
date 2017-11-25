//
//  Print.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 25/11/2017.
//  Copyright © 2017 StephenChen. All rights reserved.
//

import Foundation


public func cls_HighLightPrint<T>(msg: T,
                                 file: String = #file,
                                 functionName: String = #function,
                                 lineNumber: Int = #line)
{
    #if DEBUG
        print(" ❇️❇️❇️❇️❇️ \((file as NSString).lastPathComponent)[\(lineNumber)], \(functionName): \(msg)")
    #endif
}

public func cls_NegativePrint<T>(msg: T,
                                file: String = #file,
                                functionName: String = #function,
                                lineNumber: Int = #line)
{
    #if DEBUG
        print(" ❌❌❌❌❌ \((file as NSString).lastPathComponent)[\(lineNumber)], \(functionName): \(msg)")
    #endif
}

