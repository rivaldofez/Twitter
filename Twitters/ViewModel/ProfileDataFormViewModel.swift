//
//  ProfileDataFormViewModel.swift
//  Twitters
//
//  Created by Rivaldo Fernandes on 03/02/23.
//

import Foundation
import Combine


final class ProfileDataViewModel: ObservableObject {
    @Published var displayName: String?
    @Published var username: String?
    @Published var bio: String?
    @Published var avatarPath: String?
}
