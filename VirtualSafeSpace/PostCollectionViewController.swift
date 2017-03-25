//
//  PostCollectionViewController.swift
//  VirtualSafeSpace
//
//  Created by Stacey Vetzal on 2017-03-24.
//  Copyright © 2017 Stacey Vetzal. All rights reserved.
//

import UIKit
import SwaggerClient

private let reuseIdentifier = "PostCell"

class PostCollectionViewController: UICollectionViewController {

    let bodies = [ "Post 1", "Post 2", "Post 3", "Post 4", "Post 5", "Post 6" ]
    let authors = [ "johnny5, 1d ago", "jan, 8h ago", "johnny5, 1h ago", "johnny5, 38m ago", "jan, 8m ago", "johnny5, 3m ago" ]
    let emotes = [ "", "❤️:3 ☺️:1", "😜:7", "", "❤️:3 ☺️:1", "😜:7" ]

    var posts: [Post]?
    var infractions: [Infraction]?

    var roomId: Int32?
    var roomName: String?

    var delegate: AppDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.barTintColor = StyleKit.lightGray
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:StyleKit.primaryBlue]

        self.delegate = UIApplication.shared.delegate as? AppDelegate

        let request = RoomAPI.roomRoomIdGetWithRequestBuilder(roomId: self.roomId!)
        let auth = (self.delegate?.authCode)!
        _ = request.addHeader(name: "auth", value: auth)
        request.execute { (response, error) in
            if let postsAndInfractions = response?.body {
                if let posts = postsAndInfractions.posts {
                    self.posts = posts
                } else {
                    NSLog("No posts in response")
                }
                if let infractions = postsAndInfractions.infractions {
                    self.infractions = infractions
                }
                self.collectionView?.reloadData()
            } else {
                NSLog("Unable to retrieve posts and infractions")
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let name = self.roomName {
            NSLog("Setting room name %@", name)
        }
        self.navigationController?.title = self.roomName
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
        if let posts = self.posts {
            return posts.count
        } else {
            return 0;
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionPostViewCell

        if let posts = self.posts {
            cell.authorLabel?.text = posts[indexPath.row].handle
            cell.authorLabel?.textColor = StyleKit.green

            let emoteTotals = posts[indexPath.row].emotes
            let emotes = self.delegate?.emotes

            let emoteStrings = emoteTotals?.map({ (totals: EmoteTotals) -> String in
                if let index = emotes?.index(where: { $0.id == totals.id }) {
                    let code = emotes?[index].code
                    return "\(code!):\(totals.quantity!)"
                } else {
                    return ""
                }
            }).joined(separator: " ")
            cell.emoteLabel?.text = emoteStrings
            cell.emoteLabel?.textColor = StyleKit.darkGray

            cell.bodyText?.text = posts[indexPath.row].body
            cell.bodyText.layer.backgroundColor = StyleKit.extraLightGray.cgColor
            cell.bodyText.layer.cornerRadius = 10.0
        }

        return cell
    }

}
