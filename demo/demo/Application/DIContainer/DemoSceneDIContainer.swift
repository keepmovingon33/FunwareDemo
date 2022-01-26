//
//  DemoSceneDIContainer.swift
//  demo
//
//  Created by Sky on 22/01/2022.
//

import UIKit
import SwiftUI

final class DemoSceneDIContainer: DemoFlowCoordinatorDependencies {
    
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Use Cases
    func makeMainUseCase() -> GetMainUseCase {
        return DefaultMainUseCase(repository: makeMainRepository())
    }
    
    // MARK: - Repositories
    func makeMainRepository() -> MainRepository {
        return DefaultMainRepository(dataTransferService: dependencies.apiDataTransferService)
    }
    
    // MARK: - Posts List
    func makeMainViewController() -> MainViewController {
        return MainViewController.create(with: makeMainViewModel())
    }
    
    func makeMainViewModel() -> MainViewModel {
        return MainViewModel(useCase: makeMainUseCase())
    }

    // MARK: - Flow Coordinators
    func makeDemoFlowCoordinator(navigationController: UINavigationController) -> DemoFlowCoordinator {
        return DemoFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
}
