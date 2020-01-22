//
//  DispatchQueing.swift
//  ReduxMe
//
//  Created by Ilias Pavlidakis on 22/01/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

protocol DispatchQueing {

    func async(_ block: @escaping () -> Void)
}
