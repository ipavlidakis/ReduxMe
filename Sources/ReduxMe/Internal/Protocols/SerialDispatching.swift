//
//  SerialDispatching.swift
//  ReduxMe
//
//  Created by Ilias Pavlidakis on 22/01/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

protocol SerialDispatching {

    func enqueue(_ block: @escaping () -> Void)

    func cancelAll()
}
