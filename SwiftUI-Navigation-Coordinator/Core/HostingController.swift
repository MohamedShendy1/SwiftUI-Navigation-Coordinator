//
//  HostingController.swift
//  SwiftUI-Navigation-Coordinator
//
//  Created by mac on 06/03/2026.
//

import SwiftUI
import UIKit


class HostingController<Content: View, vm: BaseViewModel>: UIHostingController<Content> {
    
    var viewModel: vm
    init(rootView: Content, viewModel: vm) {
        self.viewModel = viewModel
        super.init(rootView: rootView)
        viewModel.hostingController = self
    }
    required init?(coder aDecoder: NSCoder) {
        preconditionFailure("init(coder:) has not been implemented")
    }
}
