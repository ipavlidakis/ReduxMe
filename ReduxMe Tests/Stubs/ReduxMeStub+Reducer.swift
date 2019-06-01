//
//  ReduxMeStub+Reducer.swift
//  ReduxMe Tests
//
//  Created by Ilias Pavlidakis on 01/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation
#if os(iOS)
import ReduxMe
#elseif os(tvOS)
import ReduxMe_tvOS
#else
import ReduxMe_macOS
#endif

extension ReduxMe.Stub {

    final class Reducer {

        private(set) var reduceWasCalled: [(state: ReduxMeStateProtocol, action: ReduxMeActionProtocol)] = []
        var reduceStubResult: Any! = ReduxMe.Stub.State.initial
    }
}

extension ReduxMe.Stub.Reducer: ReduxMeReducerProtocol {

    func reduce<State>(
        _ state: State,
        _ action: ReduxMeActionProtocol) -> State where State : ReduxMeStateProtocol {

        reduceWasCalled.append((state, action))

        return reduceStubResult as! State
    }
}

