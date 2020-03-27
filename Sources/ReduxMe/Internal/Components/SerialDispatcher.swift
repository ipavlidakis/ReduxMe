//
//  SerialDispatcher.swift
//  ReduxMe
//
//  Created by Ilias Pavlidakis on 22/01/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

final class SerialDispatcher: OperationQueue, SerialDispatching {

    override init() {
        super.init()

        self.name = String(describing: type(of: self))
        self.maxConcurrentOperationCount = 1
    }

    func enqueue(_ block: @escaping () -> Void) { addOperation(block) }

    func cancelAll() { cancelAllOperations() }
}
