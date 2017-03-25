//
//  CollectHandleViewController.swift
//  VirtualSafeSpace
//
//  Created by Stacey Vetzal on 2017-03-25.
//  Copyright © 2017 Stacey Vetzal. All rights reserved.
//

import UIKit
import SwaggerClient

class CollectHandleViewController: UIViewController {

    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var titleView: UIImageView!
    @IBOutlet weak var handleTextField: UITextField!

    @IBAction func userDidTapCreateHandle(_ sender: Any) {
        if let handle = handleTextField.text {
            let delegate = UIApplication.shared.delegate as! AppDelegate
            let invitationCode = delegate.invitationCode!
            NSLog("Invitation Code: %@", invitationCode)
            NSLog("Handle: %@", handle)
            let request = InvitationAPI.authSetupPostWithRequestBuilder(token: invitationCode, handle: handle)
            request.execute { (response, error) in
                if let auth = response?.body {
                    if let token = auth.token {
                        delegate.storeAuthCode(authCode: token)
                        self.performSegue(withIdentifier: "PresentRooms", sender: nil)
                    } else {
                        NSLog("No token in auth response?")
                    }
                } else {
                    NSLog("Unable to create person?")
                }
            }
        }
    }

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
