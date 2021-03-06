//
//  CLSInstitutionModel.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 02/10/2017.
//  Copyright © 2017 StephenChen. All rights reserved.
//

import Foundation

public struct CLSInstitution {
    
    var country: String?
    var name: String?
    var address: String?
    var phoneNumber: String?
    var applyList: String?
    var verifyDate: String?
    var websiteURL: String?
    
    init(json: [String: String]) {
        self.country = json["縣市別"]
        self.name = json["機構名稱"]
        self.address = json["機構地址"]
        self.phoneNumber = json["聯絡電話"]
        self.applyList = json["申請許可事項"]
        self.verifyDate = json["核准日期"]
        self.websiteURL = json["機關網址"]
    }
}

final class CLSInstitutionModel {
    
    typealias Handler = (_ institution: [CLSInstitution]?) -> Void
    
    func parse(completion: Handler) {
    
        var institutions: [CLSInstitution]? = nil
        defer {
            completion(institutions)
        }
        
        guard let path = Bundle.main.path(forResource: "institution", ofType: "json") else {
            cls_NegativePrint(msg: "path no found")
            return
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            cls_NegativePrint(msg: "no data")
            return
        }

        guard let jsonResult = try? JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions(rawValue: 0))  else {
            cls_NegativePrint(msg: "json Serialization fail")
            return
        }

        if let jsonArray = jsonResult as? [[String: String]] {
            var _buffer = [CLSInstitution]()
            for object in jsonArray {
                _buffer.append(CLSInstitution(json: object))
            }
            institutions = _buffer
            cls_HighLightPrint(msg: "parse success")
        } else {
            cls_NegativePrint(msg: "parse fail")
        }
    }
}
