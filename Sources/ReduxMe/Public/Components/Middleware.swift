//
//  Middleware.swift
//  ReduxMe
//
//  Created by Ilias Pavlidakis on 22/01/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

public struct Middleware<State: Hashable> {

    private let applyBlock: (_ state: State, _ action: Action) -> Void

    init(_ applyBlock: @escaping (_ state: State, _ action: Action) -> Void) {

        self.applyBlock = applyBlock
    }

    func apply(_ state: State, _ action: Action) -> Void { applyBlock(state, action) }
}
