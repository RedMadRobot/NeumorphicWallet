//
//  SceneDelegate.swift
//  NeumorphicWallet
//
//  Created by Roman Churkin on 25.05.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import UIKit
import SwiftUI


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        let contentView = CardsView()

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = HostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}

