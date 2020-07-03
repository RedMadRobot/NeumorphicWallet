//
//  EmbossedView.swift
//  NeumorphicWallet
//
//  Created by Roman Churkin on 30.06.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import SwiftUI


struct EmbossedShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3)),
                    radius: 0, x: 1.2, y: 1.2)
    }
}


extension View {
    func embossedShadow() -> some View {
        self.modifier(EmbossedShadow())
    }
}


struct EmbossedView<Content: View, Fill: View>: View {
    
    let content: Content
    let fill: Fill
    var body: some View {
        content
            .foregroundColor(.black)
            .opacity(0.3)
            .overlay(
                fill
                    .padding(-2)
                    .mask(content)
                    .embossedShadow()
                    .padding([.leading, .top], 1)
        )
    }
    
}



struct EmbossedView_Previews: PreviewProvider {
    static var previews: some View {
        let card = TestData.cards[1]
        return ZStack {
            card.colors.template.fillGradient(for: .big).edgesIgnoringSafeArea(.all)
            EmbossedView(content: Image(uiImage: card.serviceLogoBig),
                         fill: card.colors.serviceBig)
        }
    }
}
