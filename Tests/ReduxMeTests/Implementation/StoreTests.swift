//
//  StoreTests.swift
//  ReduxMe-Tests
//
//  Created by Ilias Pavlidakis on 22/01/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import XCTest
@testable import ReduxMe

final class StoreTests: XCTestCase {

    private lazy var initialState: Stub.State! = Stub.State(identifier: UUID(), substate: Stub.Substate(identifier: UUID()))
    private lazy var stubSerialDispatcher: Stub.SerialDispatcher! = .init()

    override func tearDown() {
        initialState = nil
        stubSerialDispatcher = nil
    }
}

extension StoreTests {

    func test_stateChanges_observerWasCalled() {

        let expected = 10
        let reducer = Reducer<Stub.State> { state, action in
            guard let action = action as? Stub.Action else { return state }

            return Stub.State(
                identifier: action.identifier,
                substate: state.substate)
        }

        let store = Store<Stub.State>(
            state: initialState,
            reducers: [reducer],
            serialDispatcher: stubSerialDispatcher,
            middleware: [])

        var counter = 0
        let observer = store
            .observe(keypath: \Stub.State.identifier)
            .sink { _ in counter += 1 }
        _ = observer

        (0..<(expected - 1)).forEach { _ in store.dispatch(Stub.Action()) }

        XCTAssertEqual(counter, expected)
    }

    func test_stateChanges_reducersWereCalled() {

        var reducer1WasCalled = false
        var reducer2WasCalled = false

        let reducer1 = Reducer<Stub.State> { state, action in
            reducer1WasCalled = true
            return state
        }
        let reducer2 = Reducer<Stub.State> { state, action in
            reducer2WasCalled = true
            return state
        }

        let store = Store<Stub.State>(
            state: initialState,
            reducers: [reducer1, reducer2],
            serialDispatcher: stubSerialDispatcher,
            middleware: [])

        store.dispatch(Stub.Action())

        XCTAssertTrue(reducer1WasCalled)
        XCTAssertTrue(reducer2WasCalled)
    }

    func test_stateChanges_middlewareWereCalled() {

        var middleware1WasCalled = false
        var middleware2WasCalled = false

        let middleware1 = Middleware<Stub.State> { state, action in
            middleware1WasCalled = true
        }
        let middleware2 = Middleware<Stub.State> { state, action in
            middleware2WasCalled = true
        }

        let store = Store<Stub.State>(
            state: initialState,
            reducers: [],
            serialDispatcher: stubSerialDispatcher,
            middleware: [middleware1])
        store.intercept(with: middleware2)

        store.dispatch(Stub.Action())

        XCTAssertTrue(middleware1WasCalled)
        XCTAssertTrue(middleware2WasCalled)
    }
}
