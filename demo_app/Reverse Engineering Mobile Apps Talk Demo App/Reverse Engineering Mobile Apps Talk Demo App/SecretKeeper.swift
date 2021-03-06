//
//  SecretKeeper.swift
//  Reverse Engineering Mobile Apps Talk Demo App
//
//  Created by Simon Knott on 18.04.20.
//  Copyright © 2020 Simon Knott. All rights reserved.
//

import SwiftUI

struct SecretKeeper: View {
    
    @State var input: String = ""
    
    @State var secrets: [String] = [
        "I picked my nose multiple times during Zoom calls",
        "I've bought some toilet paper in advance",
        "I've secretly been fedding the mouse in our cellar",
        "I vibe to Justin Bieber's 'Baby'",
        "Sometimes I wish I was born as a squirrel",
        "To kill time during isolation, I've bought a Wii U.",
        "My Airpod fakes from AliExpress were confiscated by customs",
        "My favorite T-Shirt has a Dugong on it"
    ]
    
    func sneakilyUploadSecretToServer() {
        guard let url = URL(string: "https://my-json-server.typicode.com/skn0tt/reverse-engineering-mobile-apps-talk/sneakySecretCollection") else {
          print("Error: cannot create URL")
          return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("text/plain", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = input.data(using: .utf8)
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest)
        task.resume()
    }
    
    func handleCommit() {
        sneakilyUploadSecretToServer()
        
        secrets.insert(input, at: 0)
        input = ""
    }
    
    var body: some View {
        VStack {
            TextField(
                "Add a secret ...",
                text: $input,
                onCommit: handleCommit
            )
                .multilineTextAlignment(.center)
            
            List(secrets, id: \.hashValue) { secret in
                Text(secret)
            }
        }
        .navigationBarTitle("Secret Keeper")
    }
}

struct SecretKeeper_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SecretKeeper()
        }
    }
}
