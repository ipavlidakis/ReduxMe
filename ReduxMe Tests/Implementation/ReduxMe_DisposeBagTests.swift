//
//  ReduxMe_DisposeBagTests.swift
//
//  Created by Ilias Pavlidakis on 3/5/19.
//  Copyright © 2019 ReduxMe All rights reserved.
//

import Foundation
import XCTest
#if os(iOS)
import ReduxMe
#elseif os(tvOS)
import ReduxMe_tvOS
#else
import ReduxMe_macOS
#endif

final class ReduxMe_DisposeBagTests: XCTestCase {

    // MARK: deinit

    func test_deinit_onDisposeWasCalledOnAllElements() {

        let elements = [ReduxMe.Stub.Disposable(), ReduxMe.Stub.Disposable()]
        var disposableBag: ReduxMe.DisposableBag? = ReduxMe.DisposableBag()
        elements.forEach { disposableBag!.add($0) }

        disposableBag = nil

        elements.forEach { XCTAssert($0.onDisposeWasCalled ?? false) }
    }
}
