//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.12.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @StateObject private var storageManager = StorageManager()
    @EnvironmentObject private var userManager: UserManager

    var body: some View {
        VStack {
            Text("Hi, \(userManager.userName)")
                .font(.largeTitle)
                .padding(.top, 84)
                
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 84)
            Spacer()
            ButtonView(
                color: .red,
                action: timer.startTimer,
                text: timer.buttonTitle
            )
            Spacer()
            ButtonView(
                color: .blue,
                action: logOut,
                text: "LogOut"
            )
        }
        .padding()
    }
    
    private func logOut() {
        userManager.userName = ""
        storageManager.userName = userManager.userName
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
