//
//  RESReduxStore.swift
//  Reservations-Framework
//
//  Created by Ilias Pavlidakis on 1/17/19.
//  Copyright © 2019 Expedia, INC. All rights reserved.
//

import Foundation

final class RESReduxStore {

    private let reducer: RESReduxReducer
    private let serialActionDispatchQueue: RESSerialDispatchQueueing
    private let mainThreadDispatcher: RESDispatching

    private var middleware: [RESReduxMiddlewareProtocol]
    private var listeners: [RESReduxListenerProtocol]

    private(set) var state: State {
        didSet {
            mainThreadDispatcher.async {
                [weak self] in
                
                self?.listeners.forEach {
                    $0.stateUpdated()
                }
            }
        }
    }

    init(state: State,
         reducers: [RESReduxReducer],
         middleware: [RESReduxMiddlewareProtocol] = [],
         listeners: [RESReduxListenerProtocol] = [],
         serialActionDispatchQueue: RESSerialDispatchQueueing,
         mainThreadDispatcher: RESDispatching = RESDispatcher(queue: .main)) {

        self.reducer = RESReduxStore.combine(reducers)
        self.middleware = middleware
        self.listeners = listeners
        self.serialActionDispatchQueue = serialActionDispatchQueue
        self.mainThreadDispatcher = mainThreadDispatcher

        self.state = state
    }
}

private extension RESReduxStore {

    static func combine(
        _ reducers: [RESReduxReducer]) -> RESReduxReducer {

        return { state, action in

            return reducers.reduce(state) { $1($0, action) }
        }
    }
}
extension RESReduxStore: RESReduxActionDispatchingProtocol {
    
    func dispatch(_ action: RESReduxActionProtocol) {
        
        serialActionDispatchQueue.enqueue { [weak self] in
            
            guard let self = self else { return }
            
            let initialState = self.state
            
            self.middleware.forEach { $0.apply(initialState, action) }
            
            self.state = self.reducer(initialState, action)
        }
    }
}

extension RESReduxStore: RESReduxStoreProtocol {

    func subscribe(
        _ listener: RESReduxListenerProtocol) -> RESReduxUnsubscribeListener {

        listeners.append(listener)

        listener.stateUpdated()

        return { [weak self] in

            guard let self = `self` else { return }

            self.listeners = self.listeners
                .filter { $0.identifier != listener.identifier }
        }
    }

    func subscribe(
        _ middleware: RESReduxMiddlewareProtocol) {

        self.middleware.append(middleware)
    }
}
