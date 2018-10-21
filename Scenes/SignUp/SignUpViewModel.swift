//
//  SignUpViewModel.swift
//  LeanNetworkKitDemo
//
//  Created by Gonzalo Reyes Huertas on 10/20/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation
import LeanNetworkKit

protocol SignUpViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var updateForm: Observable<Void> { get }
    var showError: Observable<Bool> { get }
    
    func doSignUp(with userInformation: SignUp)
}

class SignUpViewModel: SignUpViewModelProtocol {
    
    // MARK: - Observables
    
    var isLoading = Observable<Bool>()
    var updateForm = Observable<Void>()
    var showError = Observable<Bool>()
    
    // MARK: - SignUp method
    
    func doSignUp(with userInformation: SignUp) {
        isLoading.notify(with: true)
        let signupResource = SignUpResource(signUp: userInformation)
        let signupRequest = ApiRequest(resource: signupResource)
        signupRequest.load { [unowned self] (signupResult) in
            
            switch signupResult {
            case .success(let credentials):
                
                let loginResource = LoginResource(credentials: credentials)
                let loginRequest = ApiRequest(resource: loginResource)
                loginRequest.load(withCompletion: { [unowned self] (loginResult) in
                    self.isLoading.notify(with: false)
                    switch loginResult {
                    case .success:
                        self.showError.notify(with: false)
                        self.updateForm.notify(with: ())
                    case .failure:
                        self.showError.notify(with: true)
                    }
                })
                
            case .failure:
                self.isLoading.notify(with: false)
                self.showError.notify(with: true)
            }
            
        }
    }
    
}
