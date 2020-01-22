//
//  Reducer.swift
//  ReduxMe
//
//  Created by Ilias Pavlidakis on 22/01/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

public struct Reducer<State: Hashable> {

    private let identifier: AnyHashable
    private let reduceBlock: (_ state: State, _ action: Action) -> State

    init(identifier: AnyHashable = UUID(),
         _ reduceBlock: @escaping (_ state: State, _ action: Action) -> State) {

        self.identifier = identifier
        self.reduceBlock = reduceBlock
    }

    func reduce(_ state: State, _ action: Action) -> State { reduceBlock(state, action) }
}

extension Reducer: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

extension Reducer: Equatable {

    public static func == (lhs: Reducer<State>, rhs: Reducer<State>) -> Bool {
        lhs.identifier == rhs.identifier
    }
}

extension Reducer {

    static func compound<State: Hashable>(_ reducers: [Reducer<State>]) -> Reducer<State> {
        Reducer<State> { state, action in
            reducers.reduce(state) { $1.reduce($0, action) }
        }
    }
}
