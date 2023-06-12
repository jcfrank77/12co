//
//  Image+Ext.swift
//  12co
//
//  Created by Joel Frank on 6/12/23.
//

import Foundation
import SwiftUI


extension Image {
    func resizeableFit() -> some View {
        resizable()
        .aspectRatio(contentMode: .fit)
    }
}
