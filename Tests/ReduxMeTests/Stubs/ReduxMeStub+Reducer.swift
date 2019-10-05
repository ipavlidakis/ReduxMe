//
//  ReduxMeStub+Reducer.swift
//  ReduxMe Tests
//
//  Created by Ilias Pavlidakis on 01/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import ReduxMe

extension ReduxMe.Stub {

    final class Reducer {

        private(set) var reduceWasCalled: [(state: ReduxObservableProtocol, action: ReduxMeActionProtocol)] = []
        var reduceStubResult: Any! = ReduxMe.Stub.State.initial
    }
}

extension ReduxMe.Stub.Reducer: ReduxMeReducerProtocol {

    func reduce<State>(
        _ state: State,
        _ action: ReduxMeActionProtocol) -> State where State : ReduxObservableProtocol {

        reduceWasCalled.append((state, action))

        return reduceStubResult as! State
    }
}

