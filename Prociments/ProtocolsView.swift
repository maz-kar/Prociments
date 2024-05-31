//
//  ProtocolsView.swift
//  Prociments
//
//  Created by Maziar Layeghkar on 31.05.24.
//

import SwiftUI

protocol ColorThemeProtocol {
    var primary: Color { get }
    var secondary: Color { get }
    var ternary: Color { get }
}

protocol ButtonTextProtocol {
    var buttonText: String { get }
}

protocol ButtonPressedProtocol {
    func buttonPressed()
}

protocol ButtonDataSourceProtocol: ButtonPressedProtocol, ButtonTextProtocol {
    
}

class ButtonText: ButtonTextProtocol {
    var buttonText: String = "Protocols are cool!"
}

class ButtonDataSource: ButtonDataSourceProtocol {
    func buttonPressed() {
        print("Button Pressed!")
    }
    
    var buttonText: String = "Let's work with Protocols!"
}

struct DefaultColorTheme: ColorThemeProtocol {
    var primary: Color = .blue
    var secondary: Color = .white
    var ternary: Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
    var primary: Color = .red
    var secondary: Color = .white
    var ternary: Color = .green
}

struct ProtocolsView: View {
    
    let colorTheme: ColorThemeProtocol
    let dataSource: ButtonDataSourceProtocol
    
    var body: some View {
        ZStack {
            colorTheme.ternary
                .ignoresSafeArea()
            Text(dataSource.buttonText)
                .font(.headline)
                .foregroundStyle(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
                .onTapGesture {
                    dataSource.buttonPressed()
                }
        }
    }
}

#Preview {
    ProtocolsView(colorTheme: AlternativeColorTheme(), dataSource: ButtonDataSource())
}
