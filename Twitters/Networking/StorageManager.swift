//
//  StorageManager.swift
//  Twitters
//
//  Created by Rivaldo Fernandes on 03/02/23.
//

import Foundation
import Combine
import Firebase
import FirebaseStorageCombineSwift
import FirebaseStorage

enum FireStorageError: Error {
    case invalidImageID
}

final class StorageManager {
    static let shared = StorageManager()
    
    let storage = Storage.storage().reference()
    
    func getDownloadURL(for id: String?) -> AnyPublisher<URL, Error> {
        guard let id = id else {
            return Fail(error: FireStorageError.invalidImageID)
                .eraseToAnyPublisher()
        }
        return storage.storage.reference(withPath: id)
            .downloadURL()
            .eraseToAnyPublisher()
    }
    
    
    func uploadProfilePhoto(with randomID: String, image: Data, metaData: StorageMetadata) -> AnyPublisher<StorageMetadata, Error> {
        
        return storage
            .storage.reference()
            .child("images/\(randomID).jpg")
            .putData(image, metadata: metaData)
            .eraseToAnyPublisher()
    }
}
