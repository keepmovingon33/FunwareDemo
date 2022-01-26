//
//  DefaultMainRepository.swift
//  demo
//
//  Created by Sky on 22/01/2022.
//

import Foundation

final class DefaultMainRepository {

    private let dataTransferService: DataTransferService

    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension DefaultMainRepository: MainRepository {
    public func fetchList(completion: @escaping (Result<[MainEntity], Error>) -> Void) -> Cancellable? {
        let task = RepositoryTask()

        let endpoint = APIEndpoints.getItems()
        task.networkTask = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let items):
                completion(.success(items.map({$0.toDomain()})))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task
    }
}
