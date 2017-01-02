//
//  ViewController.swift
//  Networking
//
//  Created by Darko Jovanovski on 12/10/16.
//  Copyright © 2016 Darko Jovanovski. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example - Get request
        Networking().getSomething(success: { (dict) in
            print(dict)
            }) { (message) in
                print(message)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

