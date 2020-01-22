//
//  Stub+State.swift
//  ReduxMe-Tests
//
//  Created by Ilias Pavlidakis on 22/01/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

extension Stub {

    struct Substate: Hashable {
        let identifier: UUID
    }

    struct State: Hashable {

        let identifier: UUID
        let substate: Substate
    }
}
