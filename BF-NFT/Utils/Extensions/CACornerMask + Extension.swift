//
//  CACornerMask + Extension.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import Foundation
import QuartzCore

extension CACornerMask {
    static let bottomRight: CACornerMask = .layerMaxXMaxYCorner
    static let bottomLeft: CACornerMask = .layerMinXMaxYCorner
    static let topRight: CACornerMask = .layerMaxXMinYCorner
    static let topLeft: CACornerMask = .layerMinXMinYCorner
}
