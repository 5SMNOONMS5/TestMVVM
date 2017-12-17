//
//  CLSAnimationScrollModel.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 17/12/2017.
//  Copyright © 2017 StephenChen. All rights reserved.
//

import UIKit


struct Item {
    let title: String
    let imageName: String
}

final class CLSAnimationScrollModel {
    
    init() { }
    
    func getItems() -> [Item] {
        var items: [Item] = []
        for index in 0..<10 {
            let title = "Scenery " + String(index)
            let imageName = "scenery-" + String(index)
            items.append(Item(title: title, imageName: imageName))
        }
        return items
    }
}
