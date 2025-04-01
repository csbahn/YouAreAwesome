//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Chris Bahn on 3/19/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State var lastMessageNumber = -1
    @State var lastImageNumber = -1
    
    var body: some View {
        
        VStack {
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: imageName)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Show Message!") {
                let messages = ["You are Awesome",
                                "You are Great",
                                "Be the Change You Want to See!",
                                "Keep it Going!",
                                "You can do this!",
                                "When the Genius Bar Needs Help, they call You!"]
                //Determine message
                
                var messageNumber=Int.random(in: 0...messages.count-1)
                while messageNumber == lastMessageNumber {
                    messageNumber=Int.random(in: 0...messages.count-1)
                }
                message = messages[messageNumber]
                lastMessageNumber=messageNumber
                
                var imageNumber=Int.random(in: 0...9)
                while imageNumber==lastImageNumber {
                    imageNumber=Int.random(in: 0...9)
                }
                imageName="image\(imageNumber)"
                lastImageNumber=imageNumber
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
