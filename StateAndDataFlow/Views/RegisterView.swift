//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.12.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var storageManager = StorageManager()
    @EnvironmentObject private var userManager: UserManager
    @State private var userName = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $userName)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 60)
                Text("\(userName.count)")
                    .foregroundColor(changeColor())
                    .padding()
                Spacer()
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(isEnableButton())
        }
        .padding()
    }
    
    private func isEnableButton() -> Bool {
        let isEnable = userName.count < 3 ? true : false
        return isEnable
    }
    
    private func changeColor() -> Color {
        let color = userName.count < 3 ? Color.red : Color.green
        return color
    }
    
    private func registerUser() {
        if !userName.isEmpty {
            storageManager.userName = userName
            userManager.userName = storageManager.userName 
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
