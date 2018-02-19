//
//  NumberSystemManager.swift
//  AC-iOS-Unit2Final
//
//  Created by Marty Hernandez Avedon on 02/19/18.
//  Copyright © 2018 Karen Fuentes. All rights reserved.
//

import Foundation

class NumberSystemManager {
    private static let hex = Hex()
    private static let baseTen = BaseTen()
    
    var currentSystem: NumberSystem
    
    init(currentSystem: NumberSystem = NumberSystemManager.baseTen) {
        self.currentSystem = currentSystem
    }
    
    func switchSystemToHex() {
        if self.currentSystem is BaseTen {
            self.currentSystem = NumberSystemManager.hex
            return
        }
    }
    
    func switchSystemToBaseTen() {
        if self.currentSystem is Hex {
            self.currentSystem = NumberSystemManager.baseTen
            return
        }
    }
}
