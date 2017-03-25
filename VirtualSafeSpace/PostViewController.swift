//
//  PostViewController.swift
//  VirtualSafeSpace
//
//  Created by Stacey Vetzal on 2017-03-25.
//  Copyright © 2017 Stacey Vetzal. All rights reserved.
//

import UIKit
import SwaggerClient

private let reuseIdentifier = "PostCell"

class PostViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textField: UITextField!
    @IBAction func userDidClickPost(_ sender: Any) {

        let request = RoomAPI.roomRoomIdPostPostWithRequestBuilder(roomId: self.roomId!, body: self.textField.text!)
        let auth = (self.delegate?.authCode)!
        _ = request.addHeader(name: "auth", value: auth)
        request.execute { (response, error) in
            if response != nil {
                self.updatePosts()
                self.textField.text = ""
            } else {
                NSLog("Unable to retrieve posts and infractions")
            }
        }

    }

    var posts: [Post]?
    var infractions: [Infraction]?

    var roomId: Int32?
    var roomName: String?

    var delegate: AppDelegate?

    var refreshTimer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.navigationController?.navigationBar.barTintColor = StyleKit.lightGray
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:StyleKit.primaryBlue]

        self.delegate = UIApplication.shared.delegate as? AppDelegate

        updatePosts()
        
        refreshTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.updatePosts), userInfo: nil, repeats: true)
    }

    override func viewDidLayoutSubviews() {
    }
    
    func updatePosts() {
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
                let indexPath = IndexPath(item: self.posts!.count-1, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.bottom, animated: true)
            } else {
                NSLog("Unable to retrieve posts and infractions")
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.title = self.roomName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let posts = self.posts {
            return posts.count
        } else {
            return 0;
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
