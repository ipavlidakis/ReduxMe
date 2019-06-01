//
//  RTUStubRESDisposable.swift
//  Reservations-Framework-Tests
//
//  Created by Ilias Pavlidakis on 3/5/19.
//  Copyright © 2019 Expedia, INC. All rights reserved.
//

import Foundation
#if os(iOS)
import ReduxMe
#elseif os(tvOS)
import ReduxMe_tvOS
#else
import ReduxMe_macOS
#endif

extension ReduxMe.Stub {

    final class Disposable {

        private(set) var onDisposeWasCalled: Bool?
    }
}

extension ReduxMe.Stub.Disposable: ReduxMeDisposable {

    func onDispose() {

        onDisposeWasCalled = true
    }
}
