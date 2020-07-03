//
//  HostingController.swift
//  NeumorphicWallet
//
//  Created by Roman Churkin on 25.05.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import SwiftUI


// using this to provide .lightContent status bar style
class HostingController<T: View>: UIHostingController<T> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
