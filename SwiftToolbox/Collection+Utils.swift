//
//  Collection+Utils.swift
//  MultiplayerPoker
//
//  Created by Ben Davis on 10/02/2018.
//  Copyright © 2018 bendavisapps. All rights reserved.
//

import Foundation

extension Collection {
    func count(where condition: (Element)->Bool) -> Int {
        return filter(condition).count
    }
}
