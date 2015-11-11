//
//  Libreria.swift
//  Rollo1000
//
//  Created by Colaborador on 28/10/15.
//  Copyright © 2015 ITCH. All rights reserved.
//

import Foundation

func generateNum (start: Int = 1, _ end: Int = 1000) -> Int {
    return Int(arc4random_uniform(UInt32(end))) + start
}
