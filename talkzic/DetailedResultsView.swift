//
//  DetailedResultsView.swift
//  talkzic
//
//  Created by Jaden Scali on 2022-08-06.
//

import SwiftUI

struct DetailedResultsView: View {
    var flagPairs: [flagPair] = []
    let transcript: String
    @State var shouldShowTransscipt = false
    var body: some View {
        if !shouldShowTransscipt {
            VStack {
                ScrollView {
                    VStack {
                        Text("What we detected...")
                            .font(.largeTitle).bold()
                            .padding()
                        ForEach(flagPairs) { fpair in
                            TraitCard(isRed: fpair.flagIsRed, subtitle: Text(fpair.flagCategory), description: Text(fpair.flagDescrioption))
                        }
                        
                        Spacer()
                    }
                }
                Text("Transcript")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 75)
                    .background(Color("orange"))
                    .clipShape(RoundedRectangle.init(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color("orange").opacity(0.4), radius: 14, x: 0, y: 10)
                    .padding()
                    .onTapGesture {
                        shouldShowTransscipt.toggle()
                    }
            }
        } else {
            TranssciptView(transcript: transcript)
        }
    }
}

struct DetailedResultsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedResultsView(flagPairs: [
            flagPair(flagCategory: "aysbdjhas", flagDescrioption: "sadjsndkam sd", flagIsRed: true),
            flagPair(flagCategory: "hbshjdfb", flagDescrioption: "sjdf sdf sdf  sd", flagIsRed: false)
        ], transcript: "transcript")
    }
}
