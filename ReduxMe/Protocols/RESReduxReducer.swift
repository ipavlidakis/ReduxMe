//
//  ReduxReducer.swift
//  Reservations-Framework
//
//  Created by Ilias Pavlidakis on 1/17/19.
//  Copyright © 2019 Expedia, INC. All rights reserved.
//

import Foundation

typealias RESReduxReducer = (_ state: State, _ action: RESReduxActionProtocol) -> State
