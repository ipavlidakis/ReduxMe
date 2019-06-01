//
//  RESSerialDispatcher.swift
//  Reservations-Framework
//
//  Created by Tristan Warner-Smith on 08/02/2019.
//  Copyright © 2019 Expedia, INC. All rights reserved.
//

import Foundation

final class RESSerialDispatchQueue: OperationQueue, RESSerialDispatchQueueing {

    override init() {
        super.init()
        
        self.name = "RESSerialDispatchQueue"
        self.maxConcurrentOperationCount = 1
    }
    
    func enqueue(_ block: @escaping () -> Void) {
        
        self.addOperation(block)
    }
    
    func clear() {
        
        self.cancelAllOperations()
    }
}
