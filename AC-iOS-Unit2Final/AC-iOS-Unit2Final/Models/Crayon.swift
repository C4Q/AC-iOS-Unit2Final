//
//  Crayon.swift
//  AC-iOS-Unit2Final
//
//  Created by Karen Fuentes on 11/7/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import Foundation



class Crayon {
    var name: String
    var red: Double
    var green: Double
    var blue: Double
    var hex: String
    init(name: String, red: Double, green: Double, blue: Double, hex: String) {
        self.name = name
        self.red = red
        self.green = green
        self.blue = blue
        self.hex = hex
    }
    convenience init(hex: String){
        func hexToRGB(_ hex: String, _ color: String) -> Double {
            var hex = Array(hex)
            var hexToDecimal = ["1": 1, "2": 2, "3": 3, "4": 4, "5": 5,
                                "6": 6, "7": 7, "8": 8, "9": 9, "A": 10,
                                "B": 11, "C": 12, "D": 13, "E": 14, "F": 15]
            var rgbDecimal: Int = 0
            var index: Int = 0
            var endIndex: Int = 0
            var idx: Int = 0
            switch color {
            case "red":
                index = 1
            case "green":
                index = 3
            case "blue":
                index = 5
            default:
                break
            }
            endIndex = index + 1
            for chr in (index...endIndex).reversed() {
                print(chr)
                guard let convertedLetter = hexToDecimal[String(hex[chr])] else {
                    continue
                }
                print(convertedLetter)
                rgbDecimal += (convertedLetter * (Int(pow(Double(16),Double(idx)))))
                print(rgbDecimal)
                idx += 1
            }
            return Double(rgbDecimal)
        }
        self.init(name: Crayon.allTheCrayons.filter{$0.hex == hex}[0].name, red: hexToRGB(hex, "red"), green: hexToRGB(hex, "green"), blue: hexToRGB(hex, "blue"), hex: hex)
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
}

