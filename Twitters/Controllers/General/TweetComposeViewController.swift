//
//  TweetComposeViewController.swift
//  Twitters
//
//  Created by Rivaldo Fernandes on 04/02/23.
//

import UIKit

class TweetComposeViewController: UIViewController {
    
    private let tweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .twitterBlueColor
        button.setTitle("Tweet", for: .normal)
        button.layer.cornerRadius = 20
        button.tintColor = .white
        button.clipsToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        
        return button
    }()
    
    private let tweetContentTextView: UITextView = {
        let textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.layer.masksToBounds = false
        textview.layer.cornerRadius = 8
        textview.textContainerInset = .init(top: 15, left: 15, bottom: 15, right: 15)
        textview.text = "What's happening?"
        textview.textColor = .gray
        textview.font = .systemFont(ofSize: 16)
        return textview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Tweet"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapToCancel))
        
        view.addSubview(tweetButton)
        view.addSubview(tweetContentTextView)
        
        tweetContentTextView.delegate = self
        
        configureConstraints()
    }
    
    private func configureConstraints(){
        let tweetButtonConstraints = [
            tweetButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -10),
            tweetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tweetButton.widthAnchor.constraint(equalToConstant: 120),
            tweetButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let tweetContentTextViewConstraints = [
            tweetContentTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tweetContentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tweetContentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tweetContentTextView.bottomAnchor.constraint(equalTo: tweetButton.topAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(tweetButtonConstraints)
        NSLayoutConstraint.activate(tweetContentTextViewConstraints)
        
    }
    
    
    @objc private func didTapToCancel(){
        dismiss(animated: true)
    }
}


extension TweetComposeViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .gray {
            textView.textColor = .label
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "What's happening?"
            textView.textColor = .gray
        }
    }
}
