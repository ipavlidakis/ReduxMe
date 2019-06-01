//
//  ReduxMeStub+Middleware.swift
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

    final class Middleware {

        private(set) var applyStateWasCalled: [(state: ReduxMeStateProtocol, action: ReduxMeActionProtocol)] = []
    }
}

extension ReduxMe.Stub.Middleware: ReduxMeMiddlewareProtocol {

    func apply<State>(
        _ state: State,
        _ action: ReduxMeActionProtocol) where State : ReduxMeStateProtocol {

        applyStateWasCalled.append((state, action))
    }
}
