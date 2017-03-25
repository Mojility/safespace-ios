//
//  RoomCollectionViewController.swift
//  VirtualSafeSpace
//
//  Created by Stacey Vetzal on 2017-03-24.
//  Copyright © 2017 Stacey Vetzal. All rights reserved.
//

import UIKit
import SwaggerClient

private let reuseIdentifier = "RoomCell"

class RoomCollectionViewController: UICollectionViewController {

    var rooms: [Room]?
    
    var delegate: AppDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = StyleKit.lightGray
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:StyleKit.primaryBlue]
        
        self.delegate = UIApplication.shared.delegate as? AppDelegate

        let request = InitializationAPI.metadataPostWithRequestBuilder()
        let auth = (self.delegate?.authCode)!
        _ = request.addHeader(name: "auth", value: auth)
        request.execute { (response, error) in
            if let roomsAndEmotes = response?.body {
                if let r = roomsAndEmotes.rooms {
                    self.rooms = r
                } else {
                    NSLog("No rooms")
                }
                if let e = roomsAndEmotes.emotes {
                    self.delegate?.emotes = e
                } else {
                    NSLog("No emotes")
                }
                self.collectionView?.reloadData()
            } else {
                NSLog("Unable to retrieve metadata")
            }
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPaths = self.collectionView?.indexPathsForSelectedItems {
            if indexPaths.count > 0 {
                if let rooms = self.rooms {
                    if let first = indexPaths.first {
                        let navigationController = segue.destination as! UINavigationController
                        let postsViewController = navigationController.viewControllers.first as! PostViewController
                        postsViewController.roomId = rooms[first.row].id!
                        postsViewController.roomName = rooms[first.row].name!
                    }
                }
            }
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let rooms = self.rooms {
            return rooms.count
        } else {
            return 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionRoomViewCell

        if let rooms = self.rooms {
            cell.label?.text = rooms[indexPath.row].name
            cell.label?.textColor = StyleKit.teal
        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let rooms = self.rooms {
            let room = rooms[indexPath.row]
            performSegue(withIdentifier: "ShowRoom", sender: nil)
        }
    }

}
