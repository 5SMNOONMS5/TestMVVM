//
//  CLSMasterModel.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 19/11/2017.
//  Copyright © 2017 StephenChen. All rights reserved.
//

import Foundation

enum EnumLists {
    case institution
    case publicPark
    
    var controllerName: String {
        switch self {
        case .institution:
            return "CLSInstitutionViewController"
        case .publicPark:
            return "CLSPublicParkMapViewController"
        }
    }
    
    var title: String {
        switch self {
        case .institution:
            return "臺北市環境教育機構"
        case .publicPark:
            return "臺北市公開公園"
        }
    }
}

class CLSMasterModel {
    
    var lists: [EnumLists] = [.institution, .publicPark]
    
    init() {}
    
    func getList() -> [EnumLists] {
        return self.lists
    }
}



