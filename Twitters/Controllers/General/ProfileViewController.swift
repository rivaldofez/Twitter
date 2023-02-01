//
//  ProfileViewController.swift
//  Twitters
//
//  Created by Rivaldo Fernandes on 31/01/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileTableView: UITableView = {
        let tableView: UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.title = "Profile"
        
        view.addSubview(profileTableView)
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else { return UITableViewCell()}
        
        return cell 
    }
}
