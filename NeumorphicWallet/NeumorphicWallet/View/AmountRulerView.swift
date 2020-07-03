//
//  AmountRulerView.swift
//  NeumorphicWallet
//
//  Created by Roman Churkin on 30.06.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import SwiftUI


struct AmountRulerView: View {
    
    // MARK: - Properties
    
    let maxValue: Double
    var progress: CGFloat = 0
    
    private let lines = 6
    
    var isVisible: Bool = false
    var animatableData: Bool {
        get { return isVisible }
        set { isVisible = newValue }
    }
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack() {
            GeometryReader { container in
                VStack(alignment: .trailing, spacing: 0) {
                    Spacer()
                    
                    ForEach(1..<self.lines, id: \.self) { index in
                        Group {
                            GeometryReader { g in
                                self.rulerLine(at: index,
                                               geometry: g,
                                               inside: container)
                            }
                            .frame(height: 2)

                            Spacer()
                        }
                    }
                }
                VStack(alignment: .trailing) {
                    Text("$\(Int(self.maxValue))")
                        .font(.system(size: 16))
                        .foregroundColor(Color.white)
                        .padding(.vertical, 6)
                        .opacity(self.isVisible ? 1 : 0)
                    Spacer()
                    Text("$0")
                        .font(.system(size: 16))
                        .foregroundColor(Color.white)
                        .padding(.vertical, 6)
                        .opacity(self.isVisible ? 1 : 0)
                }
                .padding(.vertical, -14)
            }
        }
        .opacity(0.5)
    }
    
    
    // MARK: - Helper
    
    func rulerLine(at index: Int,
                   geometry: GeometryProxy,
                   inside container: GeometryProxy) -> some View {
        let segmentSize = container.size.height / CGFloat(lines)
        
        let rulerHeight = container.size.height
        let progressPosition  = rulerHeight*(1-progress)
        let currentPosition = geometry.frame(in: .global).midY-container.frame(in: .global).minY
        
        let before = min(1, max(0, progressPosition-segmentSize*CGFloat(index-1))/segmentSize)
        let after = min(1, max(0, (segmentSize*CGFloat(index+1)-progressPosition)/segmentSize))
        
        let modifier = progressPosition < currentPosition ? before : after
        
        let width = max(20, container.size.width*modifier) * (isVisible ? 1 : 0)
        
        return
            RoundedRectangle(cornerRadius: 1)
                .fill(Color.white.opacity(max(0.4, Double(modifier))))
                .frame(width: width)
                .offset(x: (container.size.width - width)/2)
    }
    
    func isVisibleUpdate(_ value: Bool) -> AmountRulerView {
        var `self` = self
        self.isVisible = value
        return self
    }

    func update(progress: CGFloat) -> AmountRulerView {
        var `self` = self
        self.progress = progress
        return self
    }
    
}
