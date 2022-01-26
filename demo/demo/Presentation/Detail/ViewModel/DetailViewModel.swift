//
//  DetailViewModel.swift
//  demo
//
//  Created by Sky on 23/01/2022.
//

import Foundation

protocol DetailViewModelOutput {
    var item: Observable<MainEntity?> { get }
}

class DetailViewModel: DetailViewModelOutput {
    // MARK: - OUTPUT
    let item: Observable<MainEntity?> = Observable(nil)

    // MARK: - Init
    init(item: MainEntity) {
        self.item.value = item
    }
}
