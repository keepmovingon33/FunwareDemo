//
//  PostsRepository.swift
//  demo
//
//  Created by Sky on 22/01/2022.
//

import Foundation

protocol MainRepository {
    @discardableResult
    func fetchList(completion: @escaping (Result<[MainEntity], Error>) -> Void) -> Cancellable?
}
