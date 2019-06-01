//
//  RESObservable.swift
//  Reservations-Framework
//
//  Created by Ilias Pavlidakis on 3/5/19.
//  Copyright © 2019 Expedia, INC. All rights reserved.
//

import Foundation

final class RESObservable<Substate: RESReduxSubstateProtocol & Equatable> {

    typealias SubstateType = Substate
    private let _identifier: UUID = UUID()

    private var unsubscribeBlock: RESReduxUnsubscribeListener?

    private var onChangeUpdateBlock: RESObservableUpdateBlock?
    private var onChangeDisposeBlock: (() -> Void)?
    private var lastUsedSubstate: Substate?
    private var store: RESReduxStoreProtocol!

    private let transformationBlock: RESObservableTransformationBlock

    init(transformationBlock: @escaping RESObservableTransformationBlock) {

        self.transformationBlock = transformationBlock
    }

    deinit {

        unsubscribeBlock?()
    }
}

extension RESObservable: RESObservableProtocol {

    @discardableResult
    func subscribe(on store: RESReduxStoreProtocol) -> Self {

        self.store = store
        
        self.unsubscribeBlock = store.subscribe(self)

        return self
    }

    @discardableResult
    func onChange(_ onChangeUpdateBlock: @escaping RESObservableUpdateBlock) -> Self {

        guard let _ = store else {

            assertionFailure("You subscribe to store before call onChange on Observables")

            return self
        }

        lastUsedSubstate = transformationBlock(store.state)

        self.onChangeUpdateBlock = onChangeUpdateBlock

        return self
    }

    @discardableResult
    func thenUnsubscribe() -> Self {

        onChangeDisposeBlock = { [weak self] in

            self?.unsubscribeBlock?()
        }

        return self
    }

    @discardableResult
    func disposed(
        by bag: RESDisposableBagProtocol) -> Self {

        bag.add(self)

        return self
    }
}

extension RESObservable: RESDisposable {

    func onDispose() {

        unsubscribeBlock?()
    }
}

extension RESObservable: RESReduxListenerProtocol {

    var identifier: UUID { return _identifier }

    func stateUpdated() {

        let substate = transformationBlock(store.state)
        let localLastUsedSubstate = self.lastUsedSubstate
        self.lastUsedSubstate = substate

        if localLastUsedSubstate == nil {

            onChangeUpdateBlock?(substate)
            onChangeDisposeBlock?()
        } else if
            let localLastUsedSubstate = localLastUsedSubstate,
            localLastUsedSubstate != substate {

            onChangeUpdateBlock?(substate)
            onChangeDisposeBlock?()
        }
    }
}
