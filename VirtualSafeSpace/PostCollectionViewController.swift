//
//  PostCollectionViewController.swift
//  VirtualSafeSpace
//
//  Created by Stacey Vetzal on 2017-03-24.
//  Copyright © 2017 Stacey Vetzal. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PostCell"

class PostCollectionViewController: UICollectionViewController {

    let bodies = [ "Post 1", "Post 2", "Post 3", "Post 4", "Post 5", "Post 6" ]
    let authors = [ "johnny5, 1d ago", "jan, 8h ago", "johnny5, 1h ago", "johnny5, 38m ago", "jan, 8m ago", "johnny5, 3m ago" ]
    let emotes = [ "", "❤️:3 ☺️:1", "😜:7", "", "❤️:3 ☺️:1", "😜:7" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.bodies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionPostViewCell

        cell.authorLabel?.text = authors[indexPath.row]
        cell.authorLabel?.textColor = StyleKit.green
        
        cell.emoteLabel?.text = emotes[indexPath.row]
        cell.emoteLabel?.textColor = StyleKit.darkGray

        cell.bodyText?.text = bodies[indexPath.row]
        cell.bodyText.layer.backgroundColor = StyleKit.extraLightGray.cgColor
        cell.bodyText.layer.cornerRadius = 10.0
        
        return cell
    }

}
