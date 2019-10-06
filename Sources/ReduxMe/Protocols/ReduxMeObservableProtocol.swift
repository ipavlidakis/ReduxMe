//
//  ObservableProtocol.swift
//  ReduxMe
//
//  Created by Ilias Pavlidakis on 3/5/19.
//  Copyright © 2019 ReduxMe All rights reserved.
//

import Foundation

public protocol ReduxMeObservableProtocol {

    associatedtype StateType: ReduxMeObservableTypeProtocol
    associatedtype ObservableType: ReduxMeObservableTypeProtocol

    typealias UpdateBlock = (_ newSubstate: ObservableType) -> Void
    typealias ValidationBlock = (_ newSubstate: ObservableType, _ oldSubstate: ObservableType?) -> Bool
    typealias TransformationBlock = (_ state: StateType) -> ObservableType

    @discardableResult func subscribe(on store: ReduxMe.Store<StateType>) -> Self
    @discardableResult func onChange(_ onNextChangeUpdateBlock: @escaping UpdateBlock) -> Self
    @discardableResult func onChangeValidate(_ onNextChangeValidateBlock: @escaping ValidationBlock) -> Self
    @discardableResult func thenUnsubscribe() -> Self
    @discardableResult func disposed(by bag: ReduxMeDisposableBagProtocol) -> Self
}

