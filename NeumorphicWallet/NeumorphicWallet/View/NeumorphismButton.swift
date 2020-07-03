//
//  NeumorphismButton.swift
//  NeumorphicWallet
//
//  Created by Roman Churkin on 15.06.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import SwiftUI


struct NeumorphismButton: View {
    var icon: String
    
    var body: some View {
        let gradient = Gradient(colors: [Color(#colorLiteral(red: 0.1725490196, green: 0.1921568627, blue: 0.3333333333, alpha: 1)),Color(#colorLiteral(red: 0.2509803922, green: 0.2784313725, blue: 0.4274509804, alpha: 1))])
        let linear = LinearGradient(gradient: gradient,
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
        
        return
            Button(action: {}) {
                Image(systemName: icon)
                    .resizable()
                    .padding(20)
                    .foregroundColor(Color(#colorLiteral(red: 0.6078431373, green: 0.6156862745, blue: 0.6941176471, alpha: 1)))
                    .overlay(
                        ZStack {
                            Circle()
                                .strokeBorder(
                                    linear,
                                    lineWidth: 2)
                                .shadow(color: Color.white.opacity(0.1),
                                        radius: 3, x: 2, y: 2)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.1),
                                        radius: 3, x: -2, y: -2)
                                .clipShape(Circle())
                        }
                )
                    .background(
                        ZStack {
                            Circle()
                                .shadow(color: .white, radius: 16, x: -5, y: -5)
                                .shadow(color: .black, radius: 16, x: 5, y: 5)
                                .blendMode(.overlay)
                                .opacity(0.5)
                            Circle()
                                .fill(Color(#colorLiteral(red: 0.1882352941, green: 0.2117647059, blue: 0.3490196078, alpha: 1)))
                        }
                )
            }
            .foregroundColor(Color(#colorLiteral(red: 0.1882352941, green: 0.2117647059, blue: 0.3490196078, alpha: 1)))
            .frame(width: 65, height: 65)
    }
}



struct NeumorphismButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(UIColor(named: "backgroundColor")!).edgesIgnoringSafeArea(.all)
            NeumorphismButton(icon: "magnifyingglass")
        }
    }
}
