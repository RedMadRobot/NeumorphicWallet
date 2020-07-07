//
//  CardInfoView.swift
//  NeumorphicWallet
//
//  Created by Roman Churkin on 02.07.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import SwiftUI


struct CardInfoView: View {
    
    let card: Card
    
    var value: String
    
    var body: some View {
        HStack {
            VStack(alignment:.leading, spacing: 0) {
                VStack(alignment:.leading, spacing: 10) {
                    Image(systemName: "person.fill")
                        .foregroundColor(card.colors.serviceBig)
                        .font(.system(size: 76.0))
                        .frame(width: 112, height: 112)
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding(.top, 44)
                    
                    Text(value)
                        .font(.system(size: 56))
                        .foregroundColor(.white)
                }
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)),
                        radius: 30, x: 5, y: 5)

                Spacer()
                HStack {
                    EmbossedView(content: Image(uiImage: card.serviceLogoBig),
                                 fill: card.colors.serviceBig)
                        .padding(.bottom, 46)
                    
                }
            }
            Spacer()
        }
    }
    
}



struct CardInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let card = TestData.cards[3]
        return ZStack {
            card.colors.template.fillGradient(for: .big).edgesIgnoringSafeArea(.all)
            CardInfoView(card: card, value: "$364")
                .frame(height: 400)
                .padding(.horizontal, 32)
        }
    }
}
