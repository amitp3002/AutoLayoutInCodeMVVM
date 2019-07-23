//
//  PetViewModel.swift
//  Pet
//
//  Created by Amit Patel on 7/23/19.
//  Copyright © 2019 Amit Patel. All rights reserved.
//

import UIKit

// View Model class for PetView.  The VM in MVVM
class PetViewModel {
    var dataModel:PetDataModel = PetDataModel()
    
    func retrieveImages()->[UIImage] {
        return dataModel.images
    }
}
