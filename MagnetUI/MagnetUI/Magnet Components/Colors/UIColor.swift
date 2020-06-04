//
//  UIColor.swift
//  MagnetUI
//
//  Created by Bruno Faganello Neto on 01/06/20.
//  Copyright © 2020 Bruno Faganello. All rights reserved.
//

import UIKit
import SwiftUI


extension Color {
    
    //--------------------------------------------------
    // MARK: - Semantic Color
    //--------------------------------------------------
    static let danger: Color  =  Color("danger")
    static let success: Color =  Color("success")
    static let error: Color  =  Color("error")
    static let information: Color =  Color("information")
    
}


struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Circle()
                .foregroundColor(.danger)
            Circle()
                .foregroundColor(.success)
            Circle()
                .foregroundColor(.error)
            Circle()
                .foregroundColor(.information)
        }.padding()
    }
}
