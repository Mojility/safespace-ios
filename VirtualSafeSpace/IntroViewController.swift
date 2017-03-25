//
//  IntroViewController.swift
//  VirtualSafeSpace
//
//  Created by Stacey Vetzal on 2017-03-24.
//  Copyright © 2017 Stacey Vetzal. All rights reserved.
//

import UIKit
import SwaggerClient

class IntroViewController: UIViewController {

    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var titleView: UIImageView!
    @IBOutlet weak var codeInputTextField: UITextField!
    
    @IBAction func userDidClickVerifyCode(_ sender: Any) {
        if let code = self.codeInputTextField.text {
            
            let request = InvitationAPI.authValidatePostWithRequestBuilder(token: code)
//            request.addHeader(name: "auth", value: "binglejingle") // This is the ony unauthenticated call!
            request.execute { (response, error) in
                if let validationResponse = response?.body {
                    if let exist = validationResponse.personExists {
                        let delegate = UIApplication.shared.delegate as! AppDelegate
                        delegate.storeInvitationCode(invitationCode: code)
                        if exist {
                            let request = InvitationAPI.authJoinPostWithRequestBuilder(token: code)
                            request.execute { (response, error) in
                                if let auth = response?.body {
                                    if let token = auth.token {
                                        delegate.storeAuthCode(authCode: token)
                                        self.performSegue(withIdentifier: "PresentRooms", sender: nil)
                                    } else {
                                        NSLog("No auth token after joining")
                                    }
                                } else {
                                    NSLog("Didn't unwrap auth from authJoinPost")
                                }
                            }
                        } else {
                            self.performSegue(withIdentifier: "CreateHandle", sender: nil)
                        }
                    } else {
                        NSLog("Didn't unwrap validationResponse from authValidatePost")
                    }
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
