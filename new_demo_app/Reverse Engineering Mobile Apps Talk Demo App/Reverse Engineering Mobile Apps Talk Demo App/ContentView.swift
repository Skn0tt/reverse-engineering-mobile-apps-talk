//
//  ContentView.swift
//  Reverse Engineering Mobile Apps Talk Demo App
//
//  Created by Simon Knott on 18.04.20.
//  Copyright © 2020 Simon Knott. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
                LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
