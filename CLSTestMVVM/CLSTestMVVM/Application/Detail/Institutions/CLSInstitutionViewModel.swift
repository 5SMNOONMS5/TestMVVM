//
//  CLSInstitutionViewModel.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 19/11/2017.
//  Copyright © 2017 StephenChen. All rights reserved.
//

import Foundation

final class CLSInstitutionViewModel {
    
    private var model: CLSInstitutionModel?
    
    private var institutions: [CLSInstitution]?
    
    init(completion: (_ isSuccessLoad: Bool) -> Void) {
        
        self.model = CLSInstitutionModel()
        
        self.startFetchData { sender in
            completion(sender)
        }
    }
    
    private func startFetchData(completion: (_ isSuccessLoad: Bool) -> Void) {
        
        self.model?.parse(completion: { [weak self] institutions in
            if let _institutions = institutions {
                self?.institutions = []
                self?.institutions = _institutions
                completion(true)
            } else {
                completion(false)
            }
        })
    }
    
    public func numberOfRows() -> Int {
        return self.institutions?.count ?? 0
    }
    
    public func numberOfSection() -> Int {
        return 1
    }
    
    public func getCountry(index: Int) -> String? {
        return self.institutions?[index].country
    }
    
    public func getName(index: Int) -> String? {
        return self.institutions?[index].name
    }
    
    public func getAddress(index: Int) -> String? {
        return self.institutions?[index].address
    }
    
    public func getPhoneNumber(index: Int) -> String? {
        return self.institutions?[index].phoneNumber
    }
    
    public func getApplyLists(index: Int) -> String? {
        return self.institutions?[index].applyList
    }
    
    public func getVerifyDate(index: Int) -> String? {
        return self.institutions?[index].verifyDate
    }
    
    public func getWebsite(index: Int) -> String? {
        return self.institutions?[index].websiteURL
    }
}
