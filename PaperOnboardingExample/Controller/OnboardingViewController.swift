//
//  File.swift
//  PaperOnboardingExample
//
//  Created by Bhavesh Chavda on 05/02/20.
//  Copyright © 2020 BhaveshChavda. All rights reserved.
//

import Foundation
import UIKit
import paper_onboarding

class OnboardingViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {
    
    private let onboardingView = PaperOnboarding()
    private let pagerIcon = UIImage(named: "white_circle.png")
    
     //MARK: -viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingView.dataSource = self
        onboardingView.delegate = self
        mainAutoLayout()
    }
    
     //MARK: -getStartedButton
    let getStartedButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("GET STARTED", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleGetStartedButton(_:)), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.alpha = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    /// Skips to show the user a page to select their preferences
    @objc private func handleGetStartedButton(_ sender: UIButton){
        sender.pulsate()
    }
    
    /// Lays out the onboarding view and `GET STARTED` button
    private func mainAutoLayout(){
        
        view.addSubview(onboardingView)
        view.addSubview(getStartedButton)
        onboardingView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        NSLayoutConstraint.activate([
            getStartedButton.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            getStartedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(view.frame.width/3))
        ])
    }
    
    /// The number of pages for the onboarding
    func onboardingItemsCount() -> Int {
        return 5
    }
    
    /// Sets up the pages that will be displayed during onboarding
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
        let descirptionFont = UIFont(name: "AvenirNext-Regular", size: 18)!
        
        
        return [
            OnboardingItemInfo(informationImage: UIImage(named: "img5")!,
                               title: "Welcome \n PaperOnboarding",
                               description: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                               pageIcon: pagerIcon!,
                               color: UIColor.init(hexString: "#EC7063")!,
                               titleColor: .white,
                               descriptionColor: .white,
                               titleFont: titleFont,
                               descriptionFont: descirptionFont),
            
            OnboardingItemInfo(informationImage: UIImage(named: "img2")!,
                               title: "Journey",
                               description: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                               pageIcon: pagerIcon!,
                               color: .lightBlue,
                               titleColor: .white,
                               descriptionColor: .white,
                               titleFont: titleFont,
                               descriptionFont: descirptionFont),
            
            OnboardingItemInfo(informationImage: UIImage(named: "img3")!,
                               title: "Dangerous",
                               description: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                               pageIcon: pagerIcon!,
                               color: UIColor.init(hexString: "#BDA569")!,
                               titleColor: .white,
                               descriptionColor: .white,
                               titleFont: titleFont,
                               descriptionFont: descirptionFont),
            
            OnboardingItemInfo(informationImage: UIImage(named: "img4")!,
                               title: "Weather",
                               description: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                               pageIcon: pagerIcon!,
                               color: UIColor.init(hexString: "#008B8B")!,
                               titleColor: .white,
                               descriptionColor: .white,
                               titleFont: titleFont,
                               descriptionFont: descirptionFont),
            
            OnboardingItemInfo(informationImage: UIImage(named: "img1")!,
                               title: "Settings",
                               description: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                               pageIcon: pagerIcon!,
                               color: .gloomyBlue,
                               titleColor: .white,
                               descriptionColor: .white,
                               titleFont: titleFont,
                               descriptionFont: descirptionFont),
            ][index] as OnboardingItemInfo
    }
    
    /// Makes sure the `GET STARTED` button is hidden until the last page
    func onboardingWillTransitonToIndex(_ index: Int) {
        
        if index == 3 {
            
            if self.getStartedButton.alpha == 3 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.getStartedButton.alpha = 0
                })
            }
            
        }
    }
    
    /// Animates the `GET STARTED` button to appear when on last page
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 4 {
            UIView.animate(withDuration: 0.4, animations: {
                self.getStartedButton.alpha = 1
            })
        }
    }
}

