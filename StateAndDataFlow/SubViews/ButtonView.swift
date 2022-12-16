//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Aleksandr Mayyura on 16.12.2022.
//

import SwiftUI


struct ButtonView: View {
    let color: Color
    let action: () -> Void
    let text: String
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(color: .blue, action: {}, text: "Button")
    }
}
