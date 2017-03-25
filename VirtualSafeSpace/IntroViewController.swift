//
//  IntroViewController.swift
//  VirtualSafeSpace
//
//  Created by Stacey Vetzal on 2017-03-24.
//  Copyright © 2017 Stacey Vetzal. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var titleView: UIImageView!
    @IBOutlet weak var codeInputTextField: UITextField!
    @IBOutlet weak var verifyCodeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.logoView?.image = StyleKit.imageOfLogo
        self.titleView?.image = StyleKit.imageOfTitle
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
