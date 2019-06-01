//
//  RESReduxListenerProtocol.swift
//  Reservations-Framework
//
//  Created by Ilias Pavlidakis on 1/17/19.
//  Copyright © 2019 Expedia, INC. All rights reserved.
//

import Foundation

typealias RESReduxUnsubscribeListener = () -> Void

protocol RESReduxListenerProtocol {

    var identifier: UUID { get }

    func stateUpdated()
}

extension RESReduxListenerProtocol where Self: Equatable {

    static func ==(
        lhs: RESReduxListenerProtocol,
        rhs: RESReduxListenerProtocol) -> Bool {

        return lhs.identifier == rhs.identifier
    }
}

extension RESReduxListenerProtocol where Self: Hashable {

    var hashValue: Int { return identifier.hashValue }
}

