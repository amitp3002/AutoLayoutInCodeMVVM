//
//  ViewController.swift
//  Pet
//
//  Created by Amit Patel on 7/23/19.
//  Copyright © 2019 Amit Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var petView:PetView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        petView = PetView()
        if let pv = petView {
            // Do any additional setup after loading the view.
            view.addSubview(pv)
            pv.setupView()
        }
    }
}

