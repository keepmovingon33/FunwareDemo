//
//  MainViewModel.swift
//  demo
//
//  Created by Sky on 23/01/2022.
//

import Foundation

enum LoadingType {
    case fullScreen
}

protocol MainViewModelInput {
    func viewDidLoad()
}

protocol MainViewModelOutput {
    var items: Observable<[MainEntity]> { get }
    var loading: Observable<LoadingType?> { get }
    var error: Observable<String> { get }
    var screenTitle: String { get }
    var errorTitle: String { get }
}

class MainViewModel: MainViewModelOutput {
    private let useCase: GetMainUseCase
    private var loadTask: Cancellable? { willSet { loadTask?.cancel() } }

    // MARK: - OUTPUT
    let items: Observable<[MainEntity]> = Observable([])
    let loading: Observable<LoadingType?> = Observable(.none)
    let error: Observable<String> = Observable("")
    let screenTitle = NSLocalizedString("Phun App", comment: "")
    let errorTitle = NSLocalizedString("Error", comment: "")

    // MARK: - Init

    init(useCase: GetMainUseCase) {
        self.useCase = useCase
    }

    private func load(loading: LoadingType) {
        self.loading.value = loading

        loadTask = useCase.execute(
            completion: { result in
                switch result {
                case .success(let data):
                    self.items.value = data
                case .failure(let error):
                    self.handle(error: error)
                }
                self.loading.value = .none
        })
    }

    private func handle(error: Error) {
        self.error.value = error.isInternetConnectionError ?
            NSLocalizedString("No internet connection", comment: "") :
            NSLocalizedString("Failed loading data", comment: "")
    }
}

// MARK: - INPUT. View event methods
extension MainViewModel: MainViewModelInput {
    func viewDidLoad() {
        load(loading: .fullScreen)
    }
}
