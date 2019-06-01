//
//  RESReduxSubstateListenerProtocol.swift
//  Reservations-Framework
//
//  Created by Ilias Pavlidakis on 1/17/19.
//  Copyright © 2019 Expedia, INC. All rights reserved.
//

import Foundation

protocol RESReduxSubstateListenerProtocol {

    associatedtype Substate: RESReduxSubstateProtocol

    func substateUpdated(
        _ newState: Substate)
}
