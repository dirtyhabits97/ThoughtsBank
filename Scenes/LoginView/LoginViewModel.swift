//
//  LoginViewModel.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/20/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation
import LeanNetworkKit

protocol LoginViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var updateForm: Observable<Void> { get }
    var showError: Observable<Bool> { get }
    
    func doLogin(with credentials: Credentials)
}

class LoginViewModel: LoginViewModelProtocol {
    
    // MARK: - Observables
    
    var isLoading = Observable<Bool>()
    var updateForm = Observable<Void>()
    var showError = Observable<Bool>()
    
    // MARK: - Login method
    
    func doLogin(with credentials: Credentials) {
        isLoading.notify(with: true)
        let resource = LoginResource(credentials: credentials)
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
