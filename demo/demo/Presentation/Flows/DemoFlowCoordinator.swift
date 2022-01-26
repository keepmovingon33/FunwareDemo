//
//  DemoFlowCoordinator.swift
//  demo
//
//  Created by Sky on 22/01/2022.
//

import UIKit

protocol DemoFlowCoordinatorDependencies  {
    func makeMainViewController() -> MainViewController
}

final class DemoFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: DemoFlowCoordinatorDependencies

    private weak var mainViewController: MainViewController?

    init(navigationController: UINavigationController,
         dependencies: DemoFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let vc = dependencies.makeMainViewController()

        navigationController?.pushViewController(vc, animated: false)
        navigationController?.navigationBar.prefersLargeTitles = true
        mainViewController = vc
    }
}
