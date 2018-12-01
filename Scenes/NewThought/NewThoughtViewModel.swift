//
//  NewThoughtViewModel.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/20/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation
import LeanNetworkKit

protocol NewThoughtViewModelProtocol: AnyObject {
    var isLoading: Observable<Bool> { get set }
    var showError: Observable<Bool> { get set }
    var updateForm: Observable<Void> { get set }
    
    func createNewThought(title: String, message: String?)
}

final class NewThoughtViewModel: NewThoughtViewModelProtocol {
    
    // MARK: - Observables
    
    var isLoading = Observable<Bool>()
    var showError = Observable<Bool>()
    var updateForm = Observable<Void>()
    
    // MARK: - Thought methods
    
    func createNewThought(title: String, message: String?) {
        isLoading.notify(with: true)
        let resource = CreateThoughtResource(title: title, message: message)
        let request = ApiRequest(resource: resource)
        request.load { [unowned self] (result) in
            self.isLoading.notify(with: false)
            switch result {
            case .success:
                self.showError.notify(with: false)
                self.updateForm.notify(with: ())
            case .failure:
                self.showError.notify(with: true)
            }
        }
    }
    
}
