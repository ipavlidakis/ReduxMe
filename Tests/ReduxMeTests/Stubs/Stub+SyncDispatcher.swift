//
//  Stub+SyncDispatcher.swift
//  ReduxMe-Tests
//
//  Created by Ilias Pavlidakis on 22/01/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation
@testable import ReduxMe

extension Stub {

    final class SyncDispatcher: DispatchQueing {

        func async(_ block: @escaping () -> Void) { block() }
    }
}
