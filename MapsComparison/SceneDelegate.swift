//
//  SceneDelegate.swift
//  MapsComparison
//
//  Created by Pasca Alberto, IT on 01/03/21.
//

import UIKit
import SwiftUI
import GoogleMaps

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let contentView = ContentView()

        GMSServices.provideAPIKey(<#key#>)
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}
