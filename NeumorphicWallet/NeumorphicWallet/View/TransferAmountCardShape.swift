//
//  TransferAmountCardShape.swift
//  CreditCards
//
//  Created by Roman Churkin on 01.06.2020.
//  Copyright © 2020 Firmach. All rights reserved.
//

import SwiftUI


struct TransferAmountCardShape: Shape {
    
    let progress: CGFloat
    
    var indicatorDepth: CGFloat
    
    var animatableData: CGFloat {
        get { return indicatorDepth }
        set { indicatorDepth = newValue }
    }
    
    let cornerRadius: CGFloat
    
    let inset: CGFloat
    
    func iDepthUpdate(_ value: CGFloat) -> TransferAmountCardShape {
        var `self` = self
        self.indicatorDepth = value
        return self
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let h = rect.height - inset*2
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        let d = h-(h*progress-inset+indicatorDepth) // inverted progress
        
        path.addLine(to: CGPoint(x: rect.maxX-cornerRadius, y: rect.minY))
        
        path.addArc(center: CGPoint(x: rect.maxX-cornerRadius,
                                    y: rect.minY+cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(-90),
                    endAngle: .degrees(0),
                    clockwise: false)
        
        path.addLine(to: CGPoint(x: rect.maxX,
                                 y: rect.minY+d-indicatorDepth))
        
        path.addCurve(to: CGPoint(x: rect.maxX-indicatorDepth,
                                  y: (rect.minY+d+indicatorDepth)),
                      control1: CGPoint(x: rect.maxX,
                                        y: rect.minY+d+indicatorDepth/4),
                      control2: CGPoint(x: rect.maxX-indicatorDepth,
                                        y: rect.minY+d))
        
        path.addCurve(to: CGPoint(x: rect.maxX, y: rect.minY+d+indicatorDepth*3),
                      control1: CGPoint(x: rect.maxX-indicatorDepth,
                                        y: rect.minY+d+indicatorDepth*2),
                      control2: CGPoint(x: rect.maxX,
                                        y: rect.minY+d+indicatorDepth*2-indicatorDepth/4))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: max(0, rect.maxY-cornerRadius)))
        
        path.addArc(center: CGPoint(x: rect.maxX-cornerRadius,
                                    y: rect.maxY-cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(0),
                    endAngle: .degrees(90),
                    clockwise: false)
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        path.closeSubpath()
        
        return path
    }
    
}



struct TransferAmountCardView_Previews: PreviewProvider {
    static var previews: some View {
        return ZStack {
            Color(UIColor(named: "backgroundColor")!).edgesIgnoringSafeArea(.all)
            TransferAmountCardShape(progress: 0.5,
                                   indicatorDepth: 50,
                                   cornerRadius: 20,
                                   inset: 80)
                .padding(.vertical, 88)
                .padding(.leading, 4)
                .padding(.trailing, 64)
        }
    }
}
