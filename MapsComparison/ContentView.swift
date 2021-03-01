//
//  ContentView.swift
//  MapsComparison
//
//  Created by Pasca Alberto, IT on 01/03/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            GoogleMap()
            AppleMap()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
