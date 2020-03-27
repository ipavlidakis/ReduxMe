//
//  Stub+Action.swift
//  ReduxMe-Tests
//
//  Created by Ilias Pavlidakis on 22/01/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import ReduxMe

extension Stub {

    struct Action: ReduxMe.Action, Hashable {
        let identifier = UUID()
    }
}
