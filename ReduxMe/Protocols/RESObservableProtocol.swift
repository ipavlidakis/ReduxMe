//
//  RESObservableProtocol.swift
//  Reservations-Framework
//
//  Created by Ilias Pavlidakis on 3/5/19.
//  Copyright © 2019 Expedia, INC. All rights reserved.
//

import Foundation

protocol RESObservableProtocol {

    associatedtype SubstateType

    typealias RESObservableUpdateBlock = (_ newSubstate: SubstateType) -> Void
    typealias RESObservableTransformationBlock = (_ state: State) -> SubstateType

    @discardableResult func subscribe(on store: RESReduxStoreProtocol) -> Self
    @discardableResult func onChange(_ onNextChangeUpdateBlock: @escaping RESObservableUpdateBlock) -> Self
    @discardableResult func thenUnsubscribe() -> Self
    @discardableResult func disposed(by bag: RESDisposableBagProtocol) -> Self
}
