//
//  MGButton.swift
//  MagnetUI
//
//  Created by Bruno Faganello Neto on 01/06/20.
//  Copyright © 2020 Bruno Faganello. All rights reserved.
//


import SwiftUI

struct MGButtonStyle: ButtonStyle {
    var color: Color
    var style: MGButton.Style
    
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        switch style {
        case .full: return AnyView(FullButton(color: color, configuration: configuration))
        case .border: return AnyView(BorderButton(color: color, configuration: configuration))
        case .simple: return AnyView(SimpleButton(color: color, configuration: configuration))
        case .borderCircle: return AnyView(CircleBorderButton(color: color, configuration: configuration))
        case .circle: return AnyView(CircleButton(color: color, configuration: configuration))
        }
    }
    
    struct FullButton: View {
        var color: Color
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .style(.s1)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 50)
                .background(isEnabled ? color : color.opacity(0.5))
                .cornerRadius(20)
                .opacity(configuration.isPressed ? 0.5 : 1)
        }
    }
    
    struct BorderButton: View {
        var color: Color
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .style(.s1)
                .foregroundColor(isEnabled ? color : color.opacity(0.5))
                .padding()
                .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 50)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isEnabled ? color : color.opacity(0.5), lineWidth: 1)
            )
                .opacity(configuration.isPressed ? 0.5 : 1)
        }
    }
    
    struct SimpleButton: View {
        var color: Color
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .style(.s1)
                .foregroundColor(isEnabled ? color : color.opacity(0.5))
                .padding()
                .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 50)
                .background(Color.white)
                .opacity(configuration.isPressed ? 0.5 : 1)
        }
    }
    
    struct CircleButton: View {
        var color: Color
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            
            ZStack {
                Circle()
                .fill(isEnabled ? color : color.opacity(0.5))
               
                configuration.label
                .style(.s1)
                .foregroundColor(.white)
                .padding()
                .opacity(configuration.isPressed ? 0.5 : 1)
            }.frame(maxWidth: .infinity, minHeight: 40, maxHeight: 50)
            
        }
    }
    
    struct CircleBorderButton: View {
        var color: Color
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .style(.s1)
                .foregroundColor(color)
                .padding()
                .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 50)
                .overlay(
                        Circle()
                            .stroke(isEnabled ? color : color.opacity(0.5))
                )
                .opacity(configuration.isPressed ? 0.5 : 1)
        }
    }
}



struct MGButton: View {
    
    enum Style {
        case full, border, simple, circle ,borderCircle
    }
    
    var title: String
    var style: Style = .full
    var color: Color = .information
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
        }).style(style, color: color)
    }
}

extension Button {
    /// Changes the appearance of the button
    func style(_ style: MGButton.Style, color: Color) -> some View {
        self.buttonStyle(MGButtonStyle(color: color, style: style))
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 30) {
            
            HStack {
                MGButton(title: "Fill", style: .full, action: { print("click") })
                MGButton(title: "Fill", style: .full, color: .danger, action: { print("click") })
                MGButton(title: "Fill", style: .full, color: .success, action: { print("click") })
                    .disabled(true)
            }
            
            HStack {
                MGButton(title: "Border", style: .border, action: { print("click") })
                MGButton(title: "Border", style: .border, color: .danger, action: { print("click") })
                    .disabled(true)
                MGButton(title: "Border", style: .border, color: .success, action: { print("click") })
                
            }
            
            HStack {
                MGButton(title: "Simple", style: .simple, action: { print("click") })
                MGButton(title: "Simple", style: .simple, color: .danger, action: { print("click") })
                MGButton(title: "Simple", style: .simple, color: .error, action: { print("click") })
                    .disabled(true)
            }
            
            HStack {
                MGButton(title: "A", style: .circle, action: { print("click") })
                MGButton(title: "B", style: .circle, color: .error, action: { print("click") })
                MGButton(title: "C", style: .circle, color: .success, action: { print("click") })
                    .disabled(true)
            }
            
            HStack {
                MGButton(title: "A", style: .borderCircle, action: { print("click") })
                    .disabled(true)
                MGButton(title: "B", style: .borderCircle, color: .danger, action: { print("click") })
                MGButton(title: "C", style: .borderCircle, color: .success, action: { print("click") })
            }
            
        }
    }
}
