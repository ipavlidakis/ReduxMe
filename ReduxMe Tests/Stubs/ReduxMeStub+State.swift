//
//  ReduxMeStub+State.swift
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

    struct State: ReduxMeStateProtocol, Equatable {

        let substate: ReduxMe.Stub.Substate

        static let initial = State(substate: .initial)
    }
}
