//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Chris Bahn on 3/19/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var soundName = ""
    @State var lastMessageNumber = -1
    @State var lastImageNumber = -1
    @State var lastSoundNumber = -1
    @State private var audioPlayer:AVAudioPlayer!
    let numberOfImages=10
    let numberOfSounds=6
    
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
            
            Spacer()
            
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
                
                var messageNumber:Int
                repeat  {
                    messageNumber=Int.random(in: 0...messages.count-1)
                }while messageNumber == lastMessageNumber
                
                message = messages[messageNumber]
                lastMessageNumber=messageNumber
                
                var imageNumber:Int
                repeat  {
                    imageNumber=Int.random(in: 0...(numberOfImages-1))
                }while imageNumber==lastImageNumber
                
                imageName="image\(imageNumber)"
                lastImageNumber=imageNumber
                
                //let soundName="sound0"
                var soundNumber:Int
                repeat {
                    soundNumber=Int.random(in: 0...numberOfSounds-1)
                }while soundNumber==lastSoundNumber
                
                soundName="sound\(soundNumber)"
                lastSoundNumber=soundNumber
                
                guard let soundFile=NSDataAsset(name: soundName) else {
                    print("😡Could not read file named \(soundName)")
                    return
                }
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                }catch {
                    print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
                }
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
