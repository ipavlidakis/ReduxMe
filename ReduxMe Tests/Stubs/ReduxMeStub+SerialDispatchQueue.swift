//
//  ReduxMeStub+SerialDispatchQueue.swift
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

    final class SerialDispatchQueue {

        var enqueueWasCalledWithBlock: (() -> Void)?
        var clearWasCalled: Bool = false
    }
}

extension ReduxMe.Stub.SerialDispatchQueue: ReduxMeSerialDispatchQueueing {

    func enqueue(_ block: @escaping () -> Void) {

        enqueueWasCalledWithBlock = block
        block()
    }

    func clear() {

        clearWasCalled = true
    }
}
