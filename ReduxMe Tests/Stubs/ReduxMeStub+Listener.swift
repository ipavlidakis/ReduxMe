//
//  ReduxMeStub+Listener.swift
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

    final class Listener {

        let stubIdentifier = UUID()

        private(set) var timesStateUpdatedWasCalled = 0
    }
}

extension ReduxMe.Stub.Listener: ReduxMeListenerProtocol {

    var identifier: UUID { return stubIdentifier }

    func stateUpdated() { timesStateUpdatedWasCalled += 1 }
}
