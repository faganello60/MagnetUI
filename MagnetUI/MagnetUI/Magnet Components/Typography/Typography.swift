//
//  MGTypography.swift
//  MagnetUI
//
//  Created by Bruno Faganello Neto on 02/06/20.
//  Copyright © 2020 Bruno Faganello. All rights reserved.
//

import SwiftUI


public struct MGTypography: ViewModifier {
    
    enum Style {
        
        /// Titles
        case h1, h2, h3
        
        /// Subtitles
        case s1, s2
        
        /// Paragraphs
        case p1
        
        /// Captions
        case c1
    }
    
    var style: Style
    
    public func body(content: Content) -> some View {
        
        switch style {
        
        case .h1: return content
            .font(.system(size: 36, weight: .bold))
        case .h2: return content
            .font(.system(size: 32, weight: .bold))
        case .h3: return content
            .font(.system(size: 30, weight: .bold))
        
        case .s1: return content
            .font(.system(size: 15, weight: .semibold))
        case .s2: return content
            .font(.system(size: 13, weight: .semibold))
            
        case .p1: return content
            .font(.system(size: 15, weight: .regular))
            
        case .c1: return content
            .font(.system(size: 12, weight: .light))
        }
    }
}

extension View {
    func style(_ style: MGTypography.Style) -> some View {
        self
            .modifier(MGTypography(style: style))
    }
    
    func style(_ style: MGTypography.Style, color: Color) -> some View {
        self
            .modifier(MGTypography(style: style))
            .foregroundColor(color)
    }
}

struct MSTypography_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Typography")
                .style(.h1)
            Text("Typography")
                .style(.h2)
            Text("Typography")
                .style(.h3)
            Text("Typography")
                .style(.s1)
            Text("Typography")
                .style(.s2)
            Text("Typography")
                .style(.p1)
            Text("Typography")
                .style(.c1)
        }
    }
}
