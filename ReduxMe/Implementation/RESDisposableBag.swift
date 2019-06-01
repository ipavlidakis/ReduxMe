//
//  RESDisposableBag.swift
//  Reservations-Framework
//
//  Created by Ilias Pavlidakis on 3/5/19.
//  Copyright © 2019 Expedia, INC. All rights reserved.
//

import Foundation

final class RESDisposableBag {

    private var disposableElements: [RESDisposable] = []

    deinit {

        disposableElements.forEach { $0.onDispose() }
    }
}

extension RESDisposableBag: RESDisposableBagProtocol {

    func add(
        _ element: RESDisposable) {

        disposableElements.append(element)
    }
}
