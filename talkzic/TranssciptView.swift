//
//  TranssciptView.swift
//  talkzic
//
//  Created by Jaden Scali on 2022-08-06.
//

import SwiftUI

struct TranssciptView: View {
    let transcript: String
    @State var showNew = false
    var body: some View {
        if !showNew {
            VStack {
                Text("Transcript")
                    .font(.system(size: 50))
                    .bold()
                    .foregroundColor(Color("orange"))
                    .padding()
                ScrollView {
                    Text(transcript)
                        .font(.largeTitle)
                        .padding()
                }
                Text("New Recording")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 75)
                    .background(Color("orange"))
                    .clipShape(RoundedRectangle.init(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color("orange").opacity(0.4), radius: 14, x: 0, y: 10)
                    .padding()
                    .onTapGesture {
                        showNew.toggle()
                    }
            }
        } else {
            ContentView()
        }
    }
}

struct TranssciptView_Previews: PreviewProvider {
    static var previews: some View {
        TranssciptView(transcript: "Sometimes to understand a word's meaning you need more than a definition; you need to see the word used in a sentence. At YourDictionary, we give you the tools to learn what a word means and how to use it correctly. With this sentence maker, simply type a word in the search bar and see a variety of sentences with that word used in its different ways. Our sentence generator can provide more context and relevance, ensuring you use a word the right way.")
    }
}
