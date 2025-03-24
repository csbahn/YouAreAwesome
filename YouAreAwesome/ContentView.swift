//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Chris Bahn on 3/19/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var picName = ""
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(systemName: "\(picName)")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundStyle(.black)
            
            Spacer()
            
                Button("Press Me!") {
                    if message=="" || message=="You Are Awesome!" {
                        message = "You Are Great!"
                        picName = "hand.thumbsup"
                    }else {
                        message = "You Are Awesome!"
                        picName = "sun.max.fill"
                    }
                }
                                
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
            .padding()
        
    }
}
#Preview {
    ContentView()
}
