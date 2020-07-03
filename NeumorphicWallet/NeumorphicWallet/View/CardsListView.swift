//
//  CardsListView.swift
//  NeumorphicWallet
//
//  Created by Roman Churkin on 02.07.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import SwiftUI


struct CardsListView: View {
    
    let cards: [Card]
    
    var body: some View {
        GeometryReader { topViewGeometry in
            ScrollView(.vertical, showsIndicators: false) {
                return self.scrollViewContent(for: topViewGeometry)
            }
        }
    }
    
    func scrollViewContent(for geometry: GeometryProxy) -> some View {
        let w = geometry.size.width - 24*2
        let h = ceil(w/UIConstants.cardAspectRatio)
        let topPadding = geometry.frame(in: .global).minY
        let fullHeight = h * CGFloat(cards.count)
        let contentHeight = h * CGFloat(cards.count)
        let minCardHeight = h * 0.5
        let minContentHeight = h+minCardHeight*CGFloat(cards.count-1)
        let bottomPadding = contentHeight-minContentHeight
        
        return VStack(spacing: 0) {
            ForEach(0..<cards.count) { i in
                GeometryReader  { cardGeometry in
                        self.card(at: i,
                                  geometry: cardGeometry,
                                  screenTopPadding: topPadding)
                }
                .frame(width: w, height: h)
                .zIndex(Double(self.cards.count - i))
            }
        }
        .frame(height: fullHeight)
        .padding(.horizontal, 24)
        .padding(.bottom, -bottomPadding)
    }
    
    func card(at index: Int, geometry: GeometryProxy, screenTopPadding: CGFloat) -> some View {
        let offsteAndOpacity =
            self.calculateOffsetAndOpacity(at: index,
                                           cardGeometry: geometry,
                                           topPadding: screenTopPadding)
        
        var cardView = CardView(card: cards[index])
        cardView.shadowOpacity = offsteAndOpacity.shadowOpactity
        
        return
            cardView
                .overlay(NavigationLink(destination: TransferAmountView(card: self.cards[index])) {
                    Rectangle().opacity(0)
                })
                .offset(y: -offsteAndOpacity.yOffset)
    }
    
    func calculateOffsetAndOpacity(at index: Int,
                                   cardGeometry: GeometryProxy,
                                   topPadding: CGFloat) -> (yOffset: CGFloat, shadowOpactity: CGFloat) {
        let height = cardGeometry.size.height
        let halfheight: CGFloat = height / 2
        
        let index: CGFloat = CGFloat(index)
        
        let pad = halfheight * index
        
        let shift = cardGeometry.frame(in: .global).minY - topPadding - height * index
        
        let fixedCardPosition = pad + shift
        
        if shift >= 0 {
            return (fixedCardPosition - shift * (index + 1) / 4, 1)
        } else {
            let opacity = max(fixedCardPosition / halfheight * 4, 0)
            let offset = fixedCardPosition - max(-halfheight * index, shift)
            return (offset, index==0 ? 1 : opacity)
        }
    }
    
}



struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(UIColor(named: "backgroundColor")!).edgesIgnoringSafeArea(.all)
            CardsListView(cards: TestData.cards)
        }
    }
}
