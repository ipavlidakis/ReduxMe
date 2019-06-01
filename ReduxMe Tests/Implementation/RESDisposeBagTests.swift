//
//  RESDisposeBagTests.swift
//  Reservations-Framework-Tests
//
//  Created by Ilias Pavlidakis on 3/5/19.
//  Copyright © 2019 Expedia, INC. All rights reserved.
//

import Foundation
import XCTest
import ReduxMe

final class RESDisposeBagTests: XCTestCase {

    // MARK: deinit

    func test_deinit_onDisposeWasCalledOnAllElements() {

        let elements = [ReduxMe.Stub.Disposable(), ReduxMe.Stub.Disposable()]
        var disposableBag: ReduxMe.DisposableBag? = ReduxMe.DisposableBag()
        elements.forEach { disposableBag!.add($0) }

        disposableBag = nil

        elements.forEach { XCTAssert($0.onDisposeWasCalled ?? false) }
    }
}
