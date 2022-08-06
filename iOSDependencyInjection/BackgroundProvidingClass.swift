//
//  BackgroundProvidingClass.swift
//  iOSDependencyInjection
//
//  Created by Atil Samancioglu on 6.08.2022.
//

import Foundation
import UIKit

class BackgroundProvidingClass : BackgroundProviderProtocol {
    var backgroundColor: UIColor {
    let backgroundColors : [UIColor] = [.systemGray,.systemRed,.systemMint,.systemCyan]
        return backgroundColors.randomElement()!
    }
 }
