//
//  PetDataModel.swift
//  Pet
//
//  Created by Amit Patel on 7/23/19.
//  Copyright © 2019 Amit Patel. All rights reserved.
//

import UIKit

// Class to represent the pet images.  Typically this class would use NSURLSession to retrieve the images from a server.  Once images are retrieved successfully this class would post an NSNotifcation to all interested parties. For this example we will just use the assest catalog.  This is the Model class in MVVM
class PetDataModel {
    var images:[UIImage]
    init() {
        images = [UIImage]()
        if let image1 = UIImage(named: "GermanShepherd") {
            images.append(image1)
        }
        if let image2 = UIImage(named:"LabradorRetriever") {
            images.append(image2)
        }
    }
}
