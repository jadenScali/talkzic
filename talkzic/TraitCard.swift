//
//  TraitCard.swift
//  talkzic
//
//  Created by Jaden Scali on 2022-08-06.
//

import SwiftUI

struct TraitCard: View {
    var isRed = false
    var subtitle = Text("sub")
    var description = Text("des")
    @State var bgColor = Color("red")
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    subtitle
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    .padding(EdgeInsets(top: 32, leading: 32, bottom: -30, trailing: 0))
                    
                    Spacer()
                }
                description
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(32)
                
            }
            .background(bgColor)
            .mask(
                RoundedRectangle.init(cornerRadius: 30, style: .continuous)
            )
            .shadow(color: bgColor.opacity(0.5), radius: 14, x: 0, y: 10)
            .padding()
        }
        .onAppear {
            if isRed {
                bgColor = Color("red")
            } else {
                bgColor = Color("green")
            }
        }
    }
}

struct TraitCard_Previews: PreviewProvider {
    static var previews: some View {
        TraitCard(isRed: true, subtitle: Text("Swearing"), description: Text("They SWORE AT YOU! That's terrible you need to get better ppl around u"))
    }
}
