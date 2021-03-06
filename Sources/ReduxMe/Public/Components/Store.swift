//
//  Store.swift
//  ReduxMe
//
//  Created by Ilias Pavlidakis on 22/01/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import Combine

public final class Store<State: Hashable> {

    private let reducer: Reducer<State>
    private let serialDispatcher: SerialDispatching

    private var middleware: [Middleware<State>]
    private let subject: CurrentValueSubject<State, Never>

    public var state: State { subject.value }

    public convenience init(
        state: State,
        reducers: [Reducer<State>],
        middleware: [Middleware<State>] = []) {

        self.init(
            state: state,
            reducers: reducers,
            serialDispatcher: SerialDispatcher(),
            middleware: middleware)
    }

    init(
        state: State,
        reducers: [Reducer<State>],
        serialDispatcher: SerialDispatching,
        middleware: [Middleware<State>]
    ) {
        self.subject = CurrentValueSubject<State, Never>(state)
        self.reducer = Reducer<State>.compound(reducers)
        self.serialDispatcher = serialDispatcher
        self.middleware = middleware
    }
}

public extension Store {

    func dispatch(_ action: Action) {

        serialDispatcher.enqueue { [weak self] in

            guard let self = self else { return }

            let initialState = self.state

            self.middleware.forEach { $0.apply(initialState, action) }

            let newState = self.reducer.reduce(initialState, action)

            self.subject.value = newState
        }
    }

    func intercept(with middleware: Middleware<State>) {

        self.middleware.append(middleware)
    }

    func observe<Value>(keypath: KeyPath<State, Value>) -> AnyPublisher<Value, Never> {

        subject
            .map(keypath)
            .eraseToAnyPublisher()
    }
}
