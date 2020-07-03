//
//  SliderPin.swift
//  NeumorphicWallet
//
//  Created by Roman Churkin on 30.06.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import SwiftUI


struct SliderPin: View {
    let size: CGFloat
    let colors: CardColorTemplate
    
    var body: some View {
        let backgroundGradient = colors.fillGradient(for: .big)
        let borderGradient = colors.borderGradient(for: .big)
        
        return ZStack {
            Circle()
                .fill(backgroundGradient)
                .overlay(Circle()
                    .stroke(borderGradient, lineWidth: 2)
                    .padding(2))
                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.15)), radius: 20, x: -4, y: -4)
                .shadow(color: Color(#colorLiteral(red: 0.0862745098, green: 0.1058823529, blue: 0.2039215686, alpha: 1)), radius: 30, x: 4, y: 4)
            
            Image("arrow")
            
        }
        .frame(width: size, height: size)
    }
    
}



struct SliderPin_Previews: PreviewProvider {
    static var previews: some View {
        let card = TestData.cards[2]
       return ZStack {
            Color(UIColor(named: "backgroundColor")!).edgesIgnoringSafeArea(.all)
        SliderPin(size: 68, colors: card.colors.template)
        }
    }
}
