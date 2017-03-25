//
//  RoomCollectionViewController.swift
//  VirtualSafeSpace
//
//  Created by Stacey Vetzal on 2017-03-24.
//  Copyright © 2017 Stacey Vetzal. All rights reserved.
//

import UIKit

private let reuseIdentifier = "RoomCell"

class RoomCollectionViewController: UICollectionViewController {

    let rooms = [ "Beauty from Ashes It's All About Us", "Gay Poz Guys Group", "Well Ahead", "The Pozzy" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = StyleKit.lightGray
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:StyleKit.primaryBlue]
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
        return self.rooms.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionRoomViewCell

        cell.label?.text = self.rooms[indexPath.row]
        cell.label?.textColor = StyleKit.teal
    
        return cell
    }
}
