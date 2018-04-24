//
//  Crayon.swift
//  AC-iOS-Unit2Final
//
//  Created by Karen Fuentes on 11/7/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class Crayon {
    var name: String
    var red: Double
    var green: Double
    var blue: Double
    var alpha: Double
    var hex: String
    
    init(name: String, red: Double, green: Double, blue: Double, alpha: Double = 1.0, hex: String) {
        self.name = name
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
        self.hex = hex
        
        print(self.name)
    }
    
    
    convenience init?(name: String, hex: String, alpha: Double) {
        let startIndex = hex.startIndex
        let startOfRed = hex.index(after: startIndex)
        let endOfRed = hex.index(startOfRed, offsetBy: 1)
        let startOfGreen = hex.index(after: endOfRed)
        let endOfGreen = hex.index(startOfGreen, offsetBy: 1)
        let startOfBlue = hex.index(after: endOfGreen)
        let endOfBlue = hex.index(startOfBlue, offsetBy: 1)

        let redVal = String(hex[startOfRed...endOfRed])
        let greenVal = String(hex[startOfGreen...endOfGreen])
        let blueVal = String(hex[startOfBlue...endOfBlue])
        
        let redHex = Int(redVal, radix: 16)
        let greenHex = Int(greenVal, radix: 16)
        let blueHex = Int(blueVal, radix: 16)
        
        guard let red = redHex, let green = greenHex, let blue = blueHex else {
            return nil
        }
        
        let doubleRed = Double(red)
        let doubleGreen = Double(green)
        let doubleBlue = Double(blue)
        
        self.init(name: name, red: doubleRed, green: doubleGreen, blue: doubleBlue, alpha: alpha, hex: hex)
    }
    
    static let allTheCrayons = [
        Crayon(name: "Almond", red: 239, green: 222, blue: 205, hex: "#EFDECD"),
        Crayon(name: "Antique Brass", red: 205, green: 149, blue: 117, hex: "#CD9575"),
        Crayon(name: "Apricot", red: 253, green: 217, blue: 181, hex: "#FDD9B5"),
        Crayon(name: "Aquamarine", red: 120, green: 219, blue: 226, hex: "#78DBE2"),
        Crayon(name: "Asparagus", red: 135, green:  169, blue: 107, hex: "#87A96B"),
        Crayon(name: "Atomic Tangerine", red: 255, green: 164, blue: 116, hex: "#FFA474"),
        Crayon(name: "Banana Mania", red: 250, green: 231, blue: 181, hex: "#FAE7B5"),
        Crayon(name: "Beaver", red: 159, green: 129, blue:  112, hex: "#9F8170"),
        Crayon(name: "Bittersweet", red: 253, green: 124, blue: 110, hex: "#FD7C6E"),
        Crayon(name: "Black", red: 0, green: 0, blue: 0, hex: "#000000"),
        Crayon(name: "Blizzard Blue", red: 172, green: 229, blue: 238, hex: "#ACE5EE"),
        Crayon(name: "Blue", red: 31, green: 117, blue: 254, hex: "#1F75FE"),
        Crayon(name: "Blue Bell", red: 162, green: 162, blue: 208, hex: "#A2A2D0"),
        Crayon(name: "Blue Gray", red: 102, green: 153, blue: 204, hex: "#6699CC"),
        Crayon(name: "Blue Green", red: 13, green: 152, blue: 186, hex: "#0D98BA"),
        Crayon(name: "Blue Violet", red: 115, green: 102, blue: 189, hex: "#7366BD")
    ]
    
    var cgRed: CGFloat {
        return CGFloat(self.red/255)
    }
    
    var cgGreen: CGFloat {
        return CGFloat(self.green/255)
    }
    
    var cgBlue: CGFloat {
        return CGFloat(self.blue/255)
    }
    
    var cgAlpha: CGFloat {
        return CGFloat(self.alpha)
    }
    
    var hexRed: String {
        print(self.hex)
        let startIndex = self.hex.startIndex
        let startOfRed = self.hex.index(after: startIndex)
        let endOfRed = self.hex.index(startOfRed, offsetBy: 1)
        
        let redVal = String(hex[startOfRed...endOfRed])
        
        return redVal
    }
    
    var hexGreen: String {
        let startIndex = self.hex.startIndex
        let startOfGreen = self.hex.index(startIndex, offsetBy: 3)
        let endOfGreen = self.hex.index(startOfGreen, offsetBy: 1)
        
        let greenVal = String(hex[startOfGreen...endOfGreen])
        
        return greenVal
    }
    
    var hexBlue: String {
        let startIndex = self.hex.startIndex
        let startOfBlue = self.hex.index(startIndex, offsetBy: 5)
        let endOfBlue = self.hex.index(startOfBlue, offsetBy: 1)
        
        let blueVal = String(hex[startOfBlue...endOfBlue])
        
        return blueVal
    }
    
    func getUIColor() -> UIColor {
        print(UIColor(displayP3Red: cgRed, green: cgGreen, blue: cgBlue, alpha: cgAlpha))
        return UIColor(displayP3Red: cgRed, green: cgGreen, blue: cgBlue, alpha: cgAlpha)
    }
}

