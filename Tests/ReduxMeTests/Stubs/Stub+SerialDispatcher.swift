//
//  Stub+SerialDispatcher.swift
//  ReduxMe-Tests
//
//  Created by Ilias Pavlidakis on 22/01/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

@testable import ReduxMe

extension Stub {

    final class SerialDispatcher: SerialDispatching {

        private(set) var timesEnequeueWasCalled: Int = 0
        private(set) var timesCancelAllWasCalled: Int = 0

        func enqueue(_ block: @escaping () -> Void) {

            timesEnequeueWasCalled += 1
            block()
        }

        func cancelAll() {

            timesCancelAllWasCalled += 1
        }
    }
}
