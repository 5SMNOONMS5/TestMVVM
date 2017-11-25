//
//  CLSMasterViewModel.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 02/10/2017.
//  Copyright © 2017 StephenChen. All rights reserved.
//

import Foundation

public final class CLSMasterViewModel {
    
    private var model: CLSMasterModel?
    
    public init() {
        self.model = CLSMasterModel()
    }
    
    public func numberOfRows() -> Int {
        return self.model?.getList().count ?? 0
    }
    
    public func numberOfSection() -> Int {
        return 1
    }

    public func getTitle(index: Int) -> String {
        return self.model?.lists[index].title ?? ""
    }
    
    public func getController(index: Int) -> String {
        return self.model?.lists[index].controllerName ?? ""
    }
}


