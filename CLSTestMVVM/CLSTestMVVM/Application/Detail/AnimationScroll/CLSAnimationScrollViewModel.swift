//
//  CLSAnimationScrollViewModel.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 17/12/2017.
//  Copyright © 2017 StephenChen. All rights reserved.
//

import UIKit

final class CLSAnimationScrollViewModel {
    
    private var model: CLSAnimationScrollModel?
    
    private var items: [Item] = []
    
    init() {
        self.model = CLSAnimationScrollModel()
        self.items = model?.getItems() ?? []
    }
    
    public func numberOfItemInSections() -> Int {
        return self.items.count
    }
    
    public func numberOfSection() -> Int {
        return 1
    }
    
    public func getTitle(index: IndexPath) -> String {
        if index.row > self.items.count {
            return ""
        }
        return self.items[index.row].title
    }
    
    public func getImageName(index: IndexPath) -> String {
        if index.row > self.items.count {
            return ""
        }
        return self.items[index.row].imageName
    }
}
