//
//  TransferAmountView.swift
//  NeumorphicWallet
//
//  Created by Roman Churkin on 30.06.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import SwiftUI


struct TransferAmountView: View {
    
    let card: Card
    
    @State private var isDragging: Bool = false
    
    @State private var progress: CGFloat = 0.5
    @State private var newProgress: CGFloat = 0.5
    
    @State private var showSlider: Bool = false
    
    private let currencyFormatter: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = "$"
        currencyFormatter.locale = Locale(identifier: "en")
        currencyFormatter.maximumFractionDigits = 0
        
        return currencyFormatter
    }()

    
    var body: some View {
        let cardHeight: CGFloat = 316
        let sliderPinSize: CGFloat = 68
        let indicatorDepth = sliderPinSize/2 + 10
        let sliderPad: CGFloat = indicatorDepth*2.34
        
        let longPressDrag = LongPressGesture(minimumDuration: 0.01)
            .simultaneously(with: DragGesture())
            .onChanged { (gestures) in
                self.isDragging = gestures.first ?? false
                let translation = gestures.second?.translation.height ?? 0
                self.progress = max(0, min(1, -translation/(cardHeight+sliderPinSize/2) + self.newProgress))
        }
        .onEnded { (gestures) in
            self.isDragging = false
            let translation = gestures.second?.translation.height ?? 0
            self.progress = max(0, min(1, -translation/(cardHeight+sliderPinSize/2) + self.newProgress))
            self.newProgress = self.progress
        }
        
        let backgroundGradient = card.colors.template.fillGradient(for: .big)
        let borderGradient = card.colors.template.borderGradient(for: .big)

        let cardShape = TransferAmountCardShape(progress: progress,
                               indicatorDepth: 0,
                               cornerRadius: 20,
                               inset: sliderPad)
            .iDepthUpdate(self.showSlider ? indicatorDepth : 0)
        
        let sliderOffset = cardHeight/2-CGFloat(cardHeight*progress)
        
        let currentValue = currencyFormatter.string(from: NSNumber(value: card.amonut*Double(progress))) ?? ""
        
        return ZStack {
            Color(UIColor(named: "backgroundColor")!).edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                HStack(spacing: 0) {
                    
                    cardShape
                        .fill(backgroundGradient)
                        .overlay(cardShape.stroke(borderGradient, lineWidth: 2)
                            .padding(1))
                        .shadow(color: Color(#colorLiteral(red: 0.0862745098, green: 0.1058823529, blue: 0.2039215686, alpha: 1)), radius: 30, x: -10, y: 10)
                        .zIndex(1)
                        .overlay(
                            CardInfoView(card: card, value: currentValue)
                            .padding(.horizontal, 28)
                    )
                        .padding(.vertical, -sliderPad)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.easeInOut(duration: 0.25)) {
                                    self.showSlider = true
                                }
                            }
                    }
                    
                    SliderPin(size: sliderPinSize, colors: card.colors.template)
                        .scaleEffect(isDragging ? 1.0 : 0.8)
                        .animation(.easeInOut(duration: 0.08))
                        .padding(.leading, -sliderPinSize/2)
                        .offset(y: sliderOffset)
                        .animation(nil)
                        .gesture(longPressDrag)
                        .opacity(self.showSlider ? 1 : 0 )
                        .offset(x: self.showSlider ? 0 : sliderPinSize)
                    
                    AmountRulerView(maxValue: card.amonut)
                        .update(progress: progress)
                        .isVisibleUpdate(self.showSlider)
                        .frame(width: 40)
                        .padding(.vertical, -1)
                        .padding(.trailing, 16)
                        .padding(.leading, 18)
                    
                }
                .frame(height: cardHeight)
                .padding(.leading, -4)
                
                Spacer()
                
                HStack() {
                    Spacer()
                    NeumorphismButton(icon: "arrow.right")
                    
                }
                .padding(.horizontal, 16)
                .padding(.top, 20)
                .padding(.bottom, 32)
                
            }
        }
    }
    
}



struct CustomCardTest_Previews: PreviewProvider {
    static var previews: some View {
        TransferAmountView(card: TestData.cards[2])
    }
}
