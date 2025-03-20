//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Chris Bahn on 3/19/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Image(systemName: "swift")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.orange)
            
            Text("I am an App Developer!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            }
            .padding()
        }
    }

#Preview {
    ContentView()
}
