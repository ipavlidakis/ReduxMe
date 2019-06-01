//
//  RESReduxActionDispatchingProtocol.swift
//  Reservations-Framework
//
//  Created by Tristan Warner-Smith on 14/02/2019.
//  Copyright © 2019 Expedia, INC. All rights reserved.
//

protocol RESReduxActionDispatchingProtocol {

    func dispatch(
        _ action: RESReduxActionProtocol)
}
