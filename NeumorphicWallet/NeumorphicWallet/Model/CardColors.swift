//
//  CardColors.swift
//  NeumorphicWallet
//
//  Created by Roman Churkin on 25.05.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import SwiftUI


enum CardUIState {
    case small, big
}

struct CardColorTemplate {
    
    var fillColors: [Color]
    var borderColors: [Color]
    
    func fillGradient(for cardState: CardUIState) -> LinearGradient  {
        let startPoint: UnitPoint
        let endPoint: UnitPoint
        
        switch cardState {
        case .small:
            startPoint = UnitPoint(x: 0.2, y: 0.9)
            endPoint = UnitPoint(x: 0.9, y: 0.1)
        case.big:
            startPoint = UnitPoint(x: 0.2, y: 0.1)
            endPoint = UnitPoint(x: 0.9, y: 0.9)
        }
        
        return LinearGradient(
            gradient: Gradient(colors: fillColors),
            startPoint: startPoint,
            endPoint: endPoint)
    }
    
    func borderGradient(for cardState: CardUIState) -> LinearGradient  {
        let startPoint: UnitPoint
        let endPoint: UnitPoint
        
        switch cardState {
        case .small:
            startPoint = .bottomLeading
            endPoint = .topTrailing
        case.big:
            startPoint = .topLeading
            endPoint = .bottomTrailing
        }
        
        return LinearGradient(
            gradient: Gradient(colors: borderColors),
            startPoint: startPoint,
            endPoint: endPoint)
    }
    
}

struct CardColors {
    
    // MARK: - Constants
    
    enum Predefined {
        case pink
        case blue
        case green
        case yellow
        case violet
        
        var colors: CardColors {
            switch self {
                
            case .pink:
                return CardColors(template: CardColorTemplate(fillColors: [0xA36BCF.color, 0xE77557.color],
                                                              borderColors: [0xB88BDB.color, 0xCF5942.color]),
                                  service: [0xB45E89.color, 0xB1597E.color],
                                  serviceBig: 0xBB5C72.color,
                                  chip: [0xBA5E87.color, 0xAB5688.color],
                                  number: 0x491D67.color)
                
            case .blue:
                return CardColors(template: CardColorTemplate(fillColors: [0x91EAE4.color, 0x86A8E7.color, 0x7F7FD5.color],
                                                              borderColors: [0xB4F4EF.color, 0x5959BA.color]),
                                  service: [0x6E9AD6.color, 0x6E92D8.color],
                                  serviceBig: 0x7188CF.color,
                                  chip: [0x6D94DA.color, 0x6B99D6.color],
                                  number: 0x185E66.color)
                
            case .green:
                return CardColors(template: CardColorTemplate(fillColors: [0x99F2C8.color, 0x396063.color],
                                                              borderColors: [0xB6FDDC.color, 0x254B4E.color]),
                                  service: [0x579C85.color,0x52957E.color],
                                  serviceBig: 0x518D7C.color,
                                  chip: [0x539A83.color, 0x4A947A.color],
                                  number: 0x174E34.color)
                
            case .yellow:
                return CardColors(template: CardColorTemplate(fillColors: [0xF9ED80.color, 0xDF832E.color],
                                                              borderColors: [0xFFF8B6.color, 0xB15F13.color]),
                                  service: [0xD6A63D.color, 0xCF9B34.color],
                                  serviceBig: 0xC9943C.color,
                                  chip: [0xD7A037.color, 0xD6A439.color],
                                  number: 0x5B4108.color)
                
            case .violet:
                return CardColors(template: CardColorTemplate(fillColors: [0xB0D0FF.color, 0x914CE8.color],
                                                              borderColors: [0xCADFFF.color, 0x6631B0.color]),
                                  service: [0x8E80E8.color, 0x8573E1.color],
                                  serviceBig: 0x9179EC.color,
                                  chip: [0x8D7CE7.color, 0x8A7FE4.color],
                                  number: 0x491D67.color)
            }
        }
    }
    
    
    // MARK: - Properties
    
    let template: CardColorTemplate
    let service: [Color]
    let serviceBig: Color
    let chip: [Color]
    let number: Color
    
    var serviceGradient: LinearGradient {
        return LinearGradient(
            gradient: Gradient(colors: service),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }
    
    var chipGradient: LinearGradient {
        return LinearGradient(
            gradient: Gradient(colors: chip),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }
    
}
