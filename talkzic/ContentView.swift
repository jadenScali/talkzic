//
//  ContentView.swift
//  talkzic
//
//  Created by Jaden Scali on 2022-08-06.
//

import SwiftUI
import AVFoundation
import Speech

struct ContentView: View {
    @State var bgColor = Color(.white)
    @State var flag = Image("whiteFlag")
    @State var transscipt = ""
    @State var txt = Text("Tap to record")
    @State var themeColor = Color("orange")
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State var isRecording = false
    @State var openResults = false
    var body: some View {
        if !openResults {
            ZStack {
                bgColor
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    
                    flag
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .background(
                            themeColor
                        )
                        .mask(
                            Circle()
                        )
                        .shadow(color: themeColor.opacity(0.5), radius: 8, x: 0, y: 10)
                        .padding(35)
                        .onTapGesture {
                            isRecording.toggle()
                            if isRecording {
                                txt = Text("Recording")
                                themeColor = Color("veryRed")
                                speechRecognizer.transcribe()
                            } else {
                                txt = Text("Processing")
                                themeColor = Color("green")
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                    speechRecognizer.stopTranscribing()
                                    transscipt = speechRecognizer.transcript
                                    openResults.toggle()
                                }
                            }
                        }
                    
                    Spacer()
                    
                    txt
                        .font(.system(size: 50))
                        .foregroundColor(themeColor)
                    
                    Spacer()
                }
            }
        } else {
            ResultsView(convo: transscipt)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
