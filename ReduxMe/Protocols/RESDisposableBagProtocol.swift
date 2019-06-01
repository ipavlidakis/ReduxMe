//
//  RESDisposeBag.swift
//  Reservations-Framework
//
//  Created by Ilias Pavlidakis on 3/5/19.
//  Copyright © 2019 Expedia, INC. All rights reserved.
//

import Foundation

protocol RESDisposableBagProtocol: class {

    func add(_ element: RESDisposable)
}
