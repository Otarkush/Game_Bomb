//
//  SceneDelegate.swift
//  Game_Bomb
//
//  Created by Andrew Linkov on 10.02.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let modelArray = ContentManager.fetchDataModel()
        let contentDataManager = ContentDataManager(model: modelArray)
        let mainVC = MainVC(contentDataManager: contentDataManager)
        
        
        let navigationController: UINavigationController
        navigationController = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = navigationController
        navigationController.navigationBar.isHidden = true
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}


}

