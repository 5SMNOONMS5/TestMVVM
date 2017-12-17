//
//  CLSMasterModel.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 19/11/2017.
//  Copyright © 2017 StephenChen. All rights reserved.
//

import Foundation

enum EnumLists {
    case animationScroll
    case institution
    case publicPark
    
    var controllerName: String {
        switch self {
        case .animationScroll:
            return "CLSAnimationScrollCollectionVC"
        case .institution:
            return "CLSInstitutionViewController"
        case .publicPark:
            return "CLSPublicParkMapViewController"
        }
    }
    
    var title: String {
        switch self {
        case .animationScroll:
            return "動畫特效-滑動"
        case .institution:
            return "臺北市環境教育機構"
        case .publicPark:
            return "臺北市公開公園"
        }
    }
}

class CLSMasterModel {
    
    var lists: [EnumLists] = [.animationScroll, .institution, .publicPark]
    
    init() {}
    
    func getList() -> [EnumLists] {
        return self.lists
    }
}



