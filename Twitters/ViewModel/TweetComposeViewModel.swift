//
//  TweetComposeViewModel.swift
//  Twitters
//
//  Created by Rivaldo Fernandes on 04/02/23.
//

import Foundation
import Combine
import FirebaseAuth

final class TweetComposerViewModel: ObservableObject {
    private var subscriptions: Set<AnyCancellable> = []
    
    @Published var error: String = ""
    @Published var isValidToTweet: Bool = false
    
    var tweetContent: String = ""
    private var user: TwitterUser?
    
    func getUserData(){
        guard let userId = Auth.auth().currentUser?.uid else { return }
        DatabaseManager.shared.collectionUsers(retrieve: userId)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            } receiveValue: { [unowned self] twitterUser in
                self.user = twitterUser
            }
            .store(in: &subscriptions)
    }
    
    func validateToTweet(){
        isValidToTweet = !tweetContent.isEmpty
    }
}
