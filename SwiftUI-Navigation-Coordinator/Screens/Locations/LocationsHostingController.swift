//
//  LocationsHostingController.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by Mohamed Shendy  on 17/04/2026.
//


import UIKit

class LocationsHostingController: HostingController<LocationsView, LocationsView.ViewModel> {}

//MARK: - Lifycycle
extension LocationsHostingController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

//MARK: - Setup / Configurations
private extension LocationsHostingController {
    
    
    func setupViews() {
        title = "Confirm Email"
        
        let image = UIImage(systemName: "crown")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: image,
            style: .plain,
            target: self,
            action: #selector(onUpgradeTapped)
        )
        
        if viewModel.showBackButton{
            setCustomBackButton(target: self, selector: #selector(onBackTapped))
        }
    }
}


//MARK: - Actions
extension LocationsHostingController {
   
    @objc func onBackTapped() {
        viewModel.onBatckTap()
    }
    
    @objc func onUpgradeTapped() {
        viewModel.onUpgradeTap()
    }
    
}
