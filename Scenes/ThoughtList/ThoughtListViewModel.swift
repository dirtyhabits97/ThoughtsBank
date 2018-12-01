//
//  ThoughtListViewModel.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/20/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation
import LeanNetworkKit

protocol ThoughtListViewModelProtocol: AnyObject {
    var isLoading: Observable<Bool> { get set }
    var showError: Observable<Bool> { get set }
    var updateForm: Observable<[Thought]> { get set }
    
    func loadData()
}

final class ThoughtListViewModel: ThoughtListViewModelProtocol {
    
    // MARK: - Observables
    
    var isLoading = Observable<Bool>()
    var showError = Observable<Bool>()
    var updateForm = Observable<[Thought]>()
    
    // MARK: - ThoughtList methods
    
    func loadData() {
        isLoading.notify(with: true)
        let resource = ThoughtListResource()
        let request = ApiRequest(resource: resource)
        request.load { [unowned self] (result) in
            self.isLoading.notify(with: false)
            switch result {
            case .success(let thoughts):
                self.showError.notify(with: false)
                self.updateForm.notify(with: thoughts)
            case .failure:
                self.showError.notify(with: true)
            }
        }
    }
    
}
