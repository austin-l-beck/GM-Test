//
//  LoginView.swift
//  GM-Test
//
//  Created by Austin Beck on 2/20/21.
//

import SwiftUI
import CoreData

struct LoginView: View {
    @State var enteredUsername = ""
    @State var enteredPassword = ""
    let username = "Testing"
    let password = "Password"
    @State var isCorrect = false
    @State var incorrectLogin = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Enter Username:").padding()
                TextField("...", text: $enteredUsername).padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200, height: 100)
                Text("Enter Password:").padding()
                TextField("...", text: $enteredPassword).padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200, height: 100)
                if isCorrect {
                    NavigationLink(destination: AccountView()) {
                        Text("View Account")
                    }
                } else if incorrectLogin {
                    Text("Incorrect Credentials")
                        .foregroundColor(.red)
                }
                Spacer()
                Button(action: {
                    if enteredUsername == username && enteredPassword == password {
                        isCorrect = true
                        incorrectLogin = false
                    } else {
                        isCorrect = false
                        incorrectLogin = true
                    }
                }) {
                    Text("Login")
                }.padding()
            }
        }.navigationBarTitle("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
