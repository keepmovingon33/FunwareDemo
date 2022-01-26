//
//  GetMainUseCase.swift
//  demo
//
//  Created by Sky on 22/01/2022.
//

import Foundation

protocol GetMainUseCase {
    func execute(completion: @escaping (Result<[MainEntity], Error>) -> Void) -> Cancellable?
}

final class DefaultMainUseCase: GetMainUseCase {

    private let mainRepository: MainRepository

    init(repository: MainRepository) {
        self.mainRepository = repository
    }

    func execute(completion: @escaping (Result<[MainEntity], Error>) -> Void) -> Cancellable? {
        return mainRepository.fetchList(completion: { result in
            completion(result)
        })
    }
}
