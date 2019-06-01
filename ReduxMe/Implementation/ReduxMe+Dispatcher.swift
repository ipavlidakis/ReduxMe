//
//  Dispatcher.swift
//  ReduxMe
//
//  Created by Ilias Pavlidakis on 23/01/2019.
//  Copyright © 2019 ReduxMe All rights reserved.
//

import Foundation

extension ReduxMe {

    final class Dispatcher {

        private let queue: DispatchQueue

        init(queue: DispatchQueue) {

            self.queue = queue
        }
    }
}

extension ReduxMe.Dispatcher: ReduxMeDispatching {

    func async(_ block: @escaping () -> Void) {

        queue.async(execute: block)
    }
}
