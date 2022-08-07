//
//  ResultsView.swift
//  talkzic
//
//  Created by Jaden Scali on 2022-08-06.
//

import SwiftUI

struct flagPair: Identifiable {
    var flagCategory = "swearing"
    var flagDescrioption = "des"
    var flagIsRed = false
    let id = UUID()
}

struct ResultsView: View {
    @State var convo: String
    @State var ilyCount = 0
    @State var toxicRating = 5.0
    @State var ratingFlag = Image("orangeFlag")
    @State var typeTitle = Text("title")
    @State var des = Text("Des")
    @State var themeColor = Color("orange")
    @State var insultingCategory: [String] = [
        "fuck",
        "pathetic",
        "stupid",
        "bitch",
        "failure",
        "bitch"
    ]
    @State var exCategory: [String] = [
        "ex"
    ]
    @State var emoCategory: [String] = [
        "forever",
        "kill",
        "die"
    ]
    @State var jellyCategory: [String] = [
        "mine",
        "uncomfortable",
        "belong"
    ]
    @State var redFlagkeyWords: [String] = []
    @State var niceCategory: [String] = [
        "kind",
        "beautiful",
        "smart",
        "clever",
        "cute",
        "pretty",
        "handsome",
        "funny"
    ]
    @State var supportiveCategory: [String] = [
        "love",
        "good",
        "go",
        "help",
        "dream",
        "valid",
        "support"
    ]
    @State var familyCategory: [String] = [
        "mom",
        "dad",
        "brother",
        "sister",
        "friend",
        "family"
    ]
    @State var communicationCategory: [String] = [
        "understand",
        "sorry",
        "feel"
    ]
    @State var greenFlagkeyWords: [String] = []
    @State var currentFlagPairs: [flagPair] = []
    @State var shouldShowDetailedResults = false
    var body: some View {
        if !shouldShowDetailedResults {
            VStack {
                ratingFlag
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: themeColor.opacity(0.5), radius: 8, x: 0, y: 10)
                typeTitle
                    .font(.system(size: 45))
                    .foregroundColor(themeColor)
                    .padding()
                des
                    .font(.system(size: 35))
                    .minimumScaleFactor(0.1)
                    .foregroundColor(themeColor)
                    .padding()
                
                Spacer()
                
                Text("Detailed Results")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 75)
                    .background(themeColor)
                    .clipShape(RoundedRectangle.init(cornerRadius: 30, style: .continuous))
                    .shadow(color: themeColor.opacity(0.4), radius: 14, x: 0, y: 10)
                    .padding(40)
                    .onTapGesture {
                        shouldShowDetailedResults.toggle()
                    }
                
            }.onAppear {
                
                var badwords = 0.0
                var goodwords = 0.0
                
                let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
                let components = convo.components(separatedBy: chararacterSet)
                let words = components.filter { !$0.isEmpty }
                
                for word in insultingCategory {
                    redFlagkeyWords += [word]
                }
                for word in exCategory {
                    redFlagkeyWords += [word]
                }
                for word in emoCategory {
                    redFlagkeyWords += [word]
                }
                for word in jellyCategory {
                    redFlagkeyWords += [word]
                }
                
                for word in niceCategory {
                    greenFlagkeyWords += [word]
                }
                for word in supportiveCategory {
                    greenFlagkeyWords += [word]
                }
                for word in familyCategory {
                    greenFlagkeyWords += [word]
                }
                for word in communicationCategory {
                    greenFlagkeyWords += [word]
                }
                
                for word in words {
                    
                    if word == "love" {
                        ilyCount += 1
                    }
                    
                    if insultingCategory.contains(word) {
                        let categoryPair = flagPair(flagCategory: "Insulting", flagDescrioption: "Your partner insulted you. This could be a sign that your partner is emotionally abusing you. Abusers often name-call and swear at their partners as part of the \"explosion\" phase in the cycle of abuse. After the outburst, they may try to win you back by using exaggerated gestures and pleas, but be wary. Another outburst is lilkey to occur.", flagIsRed: true)
                        
                        var isAlreadyInArray = false
                        
                        for flag in currentFlagPairs {
                            if flag.flagCategory == categoryPair.flagCategory {
                                isAlreadyInArray = true
                            }
                        }
                        if !isAlreadyInArray {
                            currentFlagPairs += [categoryPair]
                        }
                    } else if exCategory.contains(word) {
                        let categoryPair = flagPair(flagCategory: "Mentioned Their Ex", flagDescrioption: "They’re mentioning their ex. If you feel like a substitute, then this could be a sign that you should end your relationship. This means that they likely don’t have deep feelings for you, whether intentionally or not because they’re not ready for a new relationship.", flagIsRed: true)
                        
                        var isAlreadyInArray = false
                        
                        for flag in currentFlagPairs {
                            if flag.flagCategory == categoryPair.flagCategory {
                                isAlreadyInArray = true
                            }
                        }
                        if !isAlreadyInArray {
                            currentFlagPairs += [categoryPair]
                        }
                    } else if emoCategory.contains(word) {
                        let categoryPair = flagPair(flagCategory: "Emotionally Intense", flagDescrioption: "Our AI detects that your partner may be a little too intense. They may constantly call you or text you frequently, and they are way too clingy. They say that they can’t drive without you and may threaten their own-wellbeing as a tactic to keep you in this relationship.", flagIsRed: true)
                        
                        var isAlreadyInArray = false
                        
                        for flag in currentFlagPairs {
                            if flag.flagCategory == categoryPair.flagCategory {
                                isAlreadyInArray = true
                            }
                        }
                        if !isAlreadyInArray {
                            currentFlagPairs += [categoryPair]
                        }
                    } else if jellyCategory.contains(word) {
                        let categoryPair = flagPair(flagCategory: "Extreme Jealousy", flagDescrioption: "Consistent and excessive bouts of jealousy makes it hard to build trust in your relationship, especially if they are guilting you over it. Do not ignore this red flag as it may lead a controlling or abusive situation.", flagIsRed: true)
                        
                        var isAlreadyInArray = false
                        
                        for flag in currentFlagPairs {
                            if flag.flagCategory == categoryPair.flagCategory {
                                isAlreadyInArray = true
                            }
                        }
                        if !isAlreadyInArray {
                            currentFlagPairs += [categoryPair]
                        }
                    } else if niceCategory.contains(word) {
                        let categoryPair = flagPair(flagCategory: "Compliments", flagDescrioption: "Your partner gave you a compliment. This means that they think highly of you, and respect you for who you are. Compliments are essential to strong relationships, since it is important for partners to remind each other about what they love about each other.", flagIsRed: false)
                        
                        var isAlreadyInArray = false
                        
                        for flag in currentFlagPairs {
                            if flag.flagCategory == categoryPair.flagCategory {
                                isAlreadyInArray = true
                            }
                        }
                        if !isAlreadyInArray {
                            currentFlagPairs += [categoryPair]
                        }
                    } else if supportiveCategory.contains(word) {
                        let categoryPair = flagPair(flagCategory: "Being supportive", flagDescrioption: "Having a partner who is supportive of your hopes, interests, and dreams is important, since it ensures that you have each other’s backs. A good partner will be your biggest cheerleader, no matter what your aspirations may be.", flagIsRed: false)
                        
                        var isAlreadyInArray = false
                        
                        for flag in currentFlagPairs {
                            if flag.flagCategory == categoryPair.flagCategory {
                                isAlreadyInArray = true
                            }
                        }
                        if !isAlreadyInArray {
                            currentFlagPairs += [categoryPair]
                        }
                    } else if familyCategory.contains(word) {
                        let categoryPair = flagPair(flagCategory: "Likes your friends/family", flagDescrioption: "When you are in a serious relationship with someone, you will inevitably spend a lot of time with their closest friends and family. Since your partner likes your family and friends, this may mean that they are in it for the long haul!", flagIsRed: false)
                        
                        var isAlreadyInArray = false
                        
                        for flag in currentFlagPairs {
                            if flag.flagCategory == categoryPair.flagCategory {
                                isAlreadyInArray = true
                            }
                        }
                        if !isAlreadyInArray {
                            currentFlagPairs += [categoryPair]
                        }
                    } else if communicationCategory.contains(word) {
                        let categoryPair = flagPair(flagCategory: "Being supportive", flagDescrioption: "In any relationship, communication is key. At the forefront of good communication is good listening skills. The fact that your partner is kindly listening to you and responding empathetically means that they are willing to put in the emotional work to maintain a healthy, long term relationship with you.", flagIsRed: false)
                        
                        var isAlreadyInArray = false
                        
                        for flag in currentFlagPairs {
                            if flag.flagCategory == categoryPair.flagCategory {
                                isAlreadyInArray = true
                            }
                        }
                        if !isAlreadyInArray {
                            currentFlagPairs += [categoryPair]
                        }
                    }
                    
                    if redFlagkeyWords.contains(word) {
                        badwords += 1
                    } else if greenFlagkeyWords.contains(word) {
                        goodwords += 1
                    }
                }
                
                if ilyCount >= 3 {
                    let categoryPair = flagPair(flagCategory: "Love-bombing", flagDescrioption: "A form of manipulation in relationships is “love-bombing”, which is when a partner showers you with affection, declarations of love, and talk about your future, only to pull away and leave you with a broken-heart, This type of manipulation is popular with narcissists.", flagIsRed: true)
                    
                    currentFlagPairs += [categoryPair]
                }
                
                toxicRating = (badwords - goodwords) + 3
                
                var toxicLevel = 0
                
                if toxicRating > 4 {
                    toxicLevel = 5
                } else if toxicRating > 3 {
                    toxicLevel = 4
                } else if toxicRating > 2 {
                    toxicLevel = 3
                } else if toxicRating > 1 {
                    toxicLevel = 2
                } else {
                    toxicLevel = 1
                }
                
                switch toxicLevel {
                case 1:
                    des = Text("That convo was less than 20% toxic. If you don’t marry this person, I will. But seriously, your partner is a green flag, all the way! :D")
                    ratingFlag = Image("veryGreenFlag")
                    themeColor = Color("veryGreen")
                    typeTitle = Text("Pure heart")
                    break
                case 2:
                    des = Text("That convo was 20% toxic. Not the most perfect person, but hey! They have some great qualities that make them shine :)")
                    ratingFlag = Image("greenFlag")
                    themeColor = Color("green")
                    typeTitle = Text("Good Person")
                    break
                case 3:
                    des = Text("That convo was about 50% toxic. Not the best, but not the worst… you just aren’t compatible :|")
                    ratingFlag = Image("orangeFlag")
                    themeColor = Color("orange")
                    typeTitle = Text("Meh")
                    break
                case 4:
                    des = Text("That convo was 60% toxic. Clear you head, sit down and re-evaluate your relationship. Think about whether this person is right for you and voice your concerns to your partner. Counseling needed! :\\")
                    ratingFlag = Image("redFlag")
                    themeColor = Color("red")
                    typeTitle = Text("Poison Gas")
                    break
                case 5:
                    des = Text("That convo was over 80% toxic. RUN FOR THE HILLS! This person rings more alarm bells than a fire station! This relationship is not worth holding on to. You deserve the best, and your partner is not the way to go. Please break up immediately! :(")
                    ratingFlag = Image("veryredFlag")
                    themeColor = Color("veryRed")
                    typeTitle = Text("SUPER TOXIC")
                    break
                default:
                    print("ERROR")
                    break
                }
            }
        } else {
            DetailedResultsView(flagPairs: currentFlagPairs, transcript: convo)
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(convo: "fuck fuck your your")
    }
}
