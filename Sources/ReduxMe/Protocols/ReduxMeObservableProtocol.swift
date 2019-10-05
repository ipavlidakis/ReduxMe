//
//  ObservableProtocol.swift
//  ReduxMe
//
//  Created by Ilias Pavlidakis on 3/5/19.
//  Copyright © 2019 ReduxMe All rights reserved.
//

import Foundation

public protocol ReduxMeObservableProtocol {

    associatedtype StateType: ReduxObservableProtocol
    associatedtype ObservableType: ReduxObservableProtocol

    typealias UpdateBlock = (_ newSubstate: ObservableType) -> Void
    typealias TransformationBlock = (_ state: StateType) -> ObservableType

    @discardableResult func subscribe(on store: ReduxMe.Store<StateType>) -> Self
    @discardableResult func onChange(_ onNextChangeUpdateBlock: @escaping UpdateBlock) -> Self
    @discardableResult func thenUnsubscribe() -> Self
    @discardableResult func disposed(by bag: ReduxMeDisposableBagProtocol) -> Self
}

