//
//  AppFlowCoordinator.swift
//  demo
//
//  Created by Sky on 22/01/2022.
//

import UIKit

final class AppFlowCoordinator {

    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController,
         appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start() {
        let demoSceneDIContainer = appDIContainer.makeDemoSceneDIContainer()
        let flow = demoSceneDIContainer.makeDemoFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}
