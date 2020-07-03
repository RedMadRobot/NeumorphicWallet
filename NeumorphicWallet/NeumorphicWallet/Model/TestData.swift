//
//  TestData.swift
//  NeumorphicWallet
//
//  Created by Roman Churkin on 25.05.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import UIKit


enum TestData {
    
    static let cards: [Card] = [
        Card(colors: CardColors.Predefined.pink.colors,
             cardNumber: "•• 8656",
             serviceLogo: UIImage(named: "visaLogo")!,
             serviceLogoBig: UIImage(named: "visaBig")!,
             amonut: 603),
        
        Card(colors: CardColors.Predefined.blue.colors,
             cardNumber: "•• 3456",
             serviceLogo: UIImage(named: "mastercardLogo")!,
             serviceLogoBig: UIImage(named: "mastercardBig")!,
             amonut: 305),
        
        Card(colors: CardColors.Predefined.green.colors,
             cardNumber: "•• 5678",
             serviceLogo: UIImage(named: "visaLogo")!,
             serviceLogoBig: UIImage(named: "visaBig")!,
             amonut: 700),
        
        Card(colors: CardColors.Predefined.yellow.colors,
             cardNumber: "•• 2768",
             serviceLogo: UIImage(named: "visaLogo")!,
             serviceLogoBig: UIImage(named: "visaBig")!,
             amonut: 439),
        
        Card(colors: CardColors.Predefined.violet.colors,
             cardNumber: "•• 8976",
             serviceLogo: UIImage(named: "mastercardLogo")!,
             serviceLogoBig: UIImage(named: "mastercardBig")!,
             amonut: 980),
    ]
    
}
