//
//  InfractionPopOverViewController.swift
//  VirtualSafeSpace
//
//  Created by Stacey Vetzal on 2017-03-25.
//  Copyright © 2017 Stacey Vetzal. All rights reserved.
//

import UIKit
import SwaggerClient

class InfractionPopOverViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!

    var availableInfractions: [Infraction]?

    override func viewDidLoad() {
        super.viewDidLoad()

        let i1 = Infraction()
        i1.id = 1
        i1.label = "Violation violation"
        
        let i2 = Infraction()
        i2.id = 2
        i2.label = "Poor fashion sense"
        
        let i3 = Infraction()
        i3.id = 3
        i3.label = "Check your privilege"
        
        self.availableInfractions = [ i1, i2, i3 ]

        if let infractions = self.availableInfractions {
            if let stackView = self.stackView {
//                for subView in stackView.subviews {
//                    subView.removeFromSuperview()
//                }
                
                NSLog("Adding labels to stack")
                
                for infraction in infractions {
                    let label = UILabel()
                    NSLog("Label: %@", infraction.label!)
                    label.text = infraction.label
                    stackView.addSubview(label)
                }
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
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
