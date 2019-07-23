//
//  PetView.swift
//  Pet
//
//  Created by Amit Patel on 7/23/19.
//  Copyright © 2019 Amit Patel. All rights reserved.
//

import UIKit

// This is the View class in MVVM.  Class shows a custom view with images, label and colored views
class PetView : UIView {
    
    private struct Constants /* this can be renamed UserInterfaceStyles and moved out and reused throughout the app */ {
        static let marginPadding:CGFloat = 16
        static let cornerRadius:CGFloat = 5
        static let imageSize:CGFloat = 230
        static let fontName = "HelveticaNeue-Bold"
        static let fontSize:CGFloat = 18
    }
    
    private var dogView:UIImageView
    private var secondDogView:UIImageView
    private var redView:UIView
    private var blueView:UIView
    private var descriptionLabel:UILabel
    
    override init(frame: CGRect) {
        let images = PetViewModel().retrieveImages()
        self.dogView = UIImageView(image:images[0])
        self.secondDogView = UIImageView(image:images[1])
        self.redView = UIView(frame: frame)
        self.blueView = UIView(frame: frame)
        self.descriptionLabel = UILabel(frame: frame)
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupViewAttributes()
        setupImageViews()
        setUpNonImageViews()
        setupLabels()
    }
    
    
    private func setupViewAttributes() {
        dogView.layer.cornerRadius = Constants.cornerRadius
        dogView.layer.masksToBounds = true
        secondDogView.layer.cornerRadius = Constants.cornerRadius
        secondDogView.layer.masksToBounds = true
        self.addSubview(dogView)
        self.addSubview(secondDogView)
        self.addSubview(redView)
        self.addSubview(blueView)
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
        dogView.translatesAutoresizingMaskIntoConstraints = false
        secondDogView.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupImageViews() {
        if let sv = superview {
            dogView.topAnchor.constraint(equalTo: sv.safeAreaLayoutGuide.topAnchor).isActive = true
            let constraint = NSLayoutConstraint(item: dogView,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: sv,
                                                attribute: .leading,
                                                multiplier: 1, constant: Constants.marginPadding)
            
            constraint.isActive = true
            sv.addConstraint(constraint)
            dogView.widthAnchor.constraint(equalToConstant: Constants.imageSize).isActive = true
            dogView.heightAnchor.constraint(equalToConstant:Constants.imageSize).isActive = true
            
            secondDogView.topAnchor.constraint(equalTo: dogView.bottomAnchor, constant: Constants.marginPadding).isActive = true
            secondDogView.leadingAnchor.constraint(equalTo: dogView.leadingAnchor).isActive = true
            secondDogView.widthAnchor.constraint(equalTo: dogView.widthAnchor).isActive = true
            secondDogView.heightAnchor.constraint(equalTo: dogView.heightAnchor).isActive = true
        }
    }
    
    private func setUpNonImageViews() {
        redView.leadingAnchor.constraint(equalTo: dogView.trailingAnchor, constant: Constants.marginPadding).isActive = true
        redView.topAnchor.constraint(equalTo: dogView.topAnchor).isActive = true
        redView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: Constants.marginPadding).isActive = true
        blueView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        blueView.leadingAnchor.constraint(equalTo: dogView.trailingAnchor, constant: Constants.marginPadding).isActive = true
    }
    
    private func setupLabels() {
        self.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = NSLocalizedString("Two happy dogs standing on green\n grass presumably in a park.", comment: "description label")
        descriptionLabel.font = UIFont(name: Constants.fontName, size: Constants.fontSize)
        descriptionLabel.leadingAnchor.constraint(equalTo: dogView.leadingAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        if let sv = superview {
            descriptionLabel.bottomAnchor.constraint(equalTo: sv.safeAreaLayoutGuide.bottomAnchor, constant: -(Constants.marginPadding + Constants.marginPadding)).isActive = true
        }

        
    }
    // TO DO landscape orientation handling - move second image view top anchor to be equal to first image view
}
