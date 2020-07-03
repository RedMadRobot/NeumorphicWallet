//
//  CardView.swift
//  UITest
//
//  Created by Roman Churkin on 22.05.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import SwiftUI


struct CardView: View {
    
    // MARK: - Data
    
    let card: Card
    
    
    // MARK: - Animatable
    
    var shadowOpacity: CGFloat = 1
    var animatableData: CGFloat {
        get { return shadowOpacity }
        set { shadowOpacity = newValue }
    }
    
    var body: some View {
        let backgroundGradient = card.colors.template.fillGradient(for: .small)
        let borderGradient = card.colors.template.borderGradient(for: .small)
        let serviceGradient = card.colors.serviceGradient
        let chipGradient = card.colors.chipGradient

        return ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 20)
                .fill(backgroundGradient)
            
            VStack {
                EmbossedView(content: Image(uiImage: UIImage(named: "chip")!),
                              fill: chipGradient)
                    .padding([.leading,.top], 30)
                Spacer()
            }
            
            HStack {
                Spacer()
                EmbossedView(content: Image(uiImage: card.serviceLogo),
                             fill: serviceGradient)
                    .padding(34)
            }
            
            Text(card.cardNumber)
                .foregroundColor(card.colors.number)
                .font(.system(size: 20.0))
                .fontWeight(.medium)
                .opacity(0.6)
                .embossedShadow()
                .padding(.leading, 34)
                .padding(.bottom, 28)
        }
        .overlay(RoundedRectangle(cornerRadius: 20)
        .stroke(borderGradient, lineWidth: 2)
        .padding(1))
        .cornerRadius(20)
        .aspectRatio(UIConstants.cardAspectRatio, contentMode: .fit)
        .shadow(color: Color(#colorLiteral(red: 0.1607843137, green: 0.1843137255, blue: 0.3333333333, alpha: 0.55).withAlphaComponent(shadowOpacity)),
                radius: 33, x: 12, y: 12)
        
    }
    
}



struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(UIColor(named: "backgroundColor")!).edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(0..<TestData.cards.count) { i in
                        CardView(card: TestData.cards[i])
                    }
                }
                .padding(.horizontal, 26)
            }
        }
    }
}

