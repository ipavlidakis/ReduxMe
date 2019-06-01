//
//  RESReduxStoreProtocol.swift
//  Reservations-Framework
//
//  Created by Ilias Pavlidakis on 1/17/19.
//  Copyright © 2019 Expedia, INC. All rights reserved.
//

import Foundation

protocol RESReduxStoreProtocol: RESReduxActionDispatchingProtocol {

    var state: State { get }

    func subscribe(
        _ listener: RESReduxListenerProtocol) -> RESReduxUnsubscribeListener

    func subscribe(
        _ middleware: RESReduxMiddlewareProtocol)
}
