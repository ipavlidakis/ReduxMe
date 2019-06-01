//
//  RESDispatcher.swift
//  Reservations-Framework
//
//  Created by Tristan Warner-Smith on 23/01/2019.
//  Copyright © 2019 Expedia, INC. All rights reserved.
//

import Foundation

final class RESDispatcher: RESDispatching {

    let queue: DispatchQueue
    
    init(queue: DispatchQueue) {
        
        self.queue = queue
    }
    
    func async(_ block: @escaping () -> Void) {
        
        queue.async(execute: block)
    }
}
