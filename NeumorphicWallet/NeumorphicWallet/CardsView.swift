//
//  CardsView.swift
//  NeumorphicWallet
//
//  Created by Roman Churkin on 25.05.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import SwiftUI


struct CardsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor(named: "backgroundColor")!).edgesIgnoringSafeArea(.all)

            CardsListView(cards: TestData.cards)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
        .accentColor(Color(#colorLiteral(red: 0.6078431373, green: 0.6156862745, blue: 0.6941176471, alpha: 1)))
    }
}



struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
