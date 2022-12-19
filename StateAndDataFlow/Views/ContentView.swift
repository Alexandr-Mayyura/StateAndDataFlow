//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.12.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
            
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            
            Spacer()
            
            VStack {
                Spacer()
                ButtonView(color: .red, action:  timer.startTimer, text: timer.buttonTitle)
    
                Spacer()
                ButtonView(color: .blue, action: {  DataManager.shared.clear(userManager: userManager)
                }, text: "LogOut")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
