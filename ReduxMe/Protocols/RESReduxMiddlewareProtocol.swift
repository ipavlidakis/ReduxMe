//
//  RESReduxMiddlewareProtocol.swift
//  Reservations-Framework
//
//  Created by Ilias Pavlidakis on 1/17/19.
//  Copyright © 2019 Expedia, INC. All rights reserved.
//

import Foundation

protocol RESReduxMiddlewareProtocol {

    func apply(
        _ state: State,
        _ action: RESReduxActionProtocol)
}
