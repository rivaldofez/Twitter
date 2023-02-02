//
//  RegisterViewModel.swift
//  Twitters
//
//  Created by Rivaldo Fernandes on 02/02/23.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    @Published var email: String?
    @Published var password: String?
    @Published var isRegistrationFormValid: Bool = false
    
    func validateRegistrationForm(){
        
    }
    
}
