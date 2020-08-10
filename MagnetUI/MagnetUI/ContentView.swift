//
//  ContentView.swift
//  MagnetUI
//
//  Created by Bruno Faganello Neto on 01/06/20.
//  Copyright © 2020 Bruno Faganello. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldAnimateScale = false
    @State private var shouldBlockButton = false
    @State private var shouldAnimateOpacity = false
    
    var body: some View {
        MGButton(title: "Teste") {
            self.shouldAnimateScale.toggle()
            self.shouldBlockButton.toggle()
            self.shouldAnimateOpacity.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                self.shouldAnimateScale.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.shouldAnimateOpacity.toggle()
                    self.shouldBlockButton.toggle()
                }
            }
            
           
        }
        .disabled(shouldBlockButton)
        .overlay(overlayView)
        .padding()
    }
    
    
    private var overlayView: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 1)
                .scaleEffect(shouldAnimateScale ? 1.1 : 0.0)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 1)
                .scaleEffect(shouldAnimateScale ? 1.3 : 0.0)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 1)
                .scaleEffect(shouldAnimateScale ? 1.5 : 0)
        }
        .opacity(shouldAnimateOpacity ? 0.0: 1.0)
        .animation(Animation.easeInOut(duration: 1))
    }
    
    private var emptyOverlayView: some View {
        return Circle().foregroundColor(.clear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
