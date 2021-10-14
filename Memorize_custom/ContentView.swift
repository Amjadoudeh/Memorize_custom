//
//  ContentView.swift
//  Memorize_custom
//
//  Created by Amjad Oudeh on 11.10.21.
//
//Required Tasks
//1. Get the Memorize game working as demonstrated in lectures 1 and 2. Type in all the code. Do not copy/paste from anywhere. ✔️

//2. You can remove the ⊖ and ⊕ buttons at the bottom of the screen.✔️

//3. Add a title “Memorize!” to the top of the screen.✔️

//4. Add at least 3 “theme choosing” buttons to your UI, each of which causes all of the cards to be replaced with new cards that contain emoji that match the chosen theme. You can use Vehicles from lecture as one of the 3 themes if you want to, but you are welcome to create 3 (or more) completely new themes. ✔️

//5. The number of cards in each of your 3 themes should be different, but in no case fewer than 8.

//6. The cards that appear when a theme button is touched should be in an unpredictable
//(i.e. random) order. In other words, the cards should be shuffled each time a theme
//button is chosen.
//7. The theme-choosing buttons must include an image representing the theme and text describing the theme stacked on top of each other vertically.

//8. The image portion of each of the theme-choosing buttons must be created using an SF Symbol which evokes the idea of the theme it chooses (like the car symbol and the Vehicles theme shown in the Screenshot section below).✔️

//9. The text description of the theme-choosing buttons must use a noticeably smaller font than the font we chose for the emoji on the cards.✔️

//10.Your UI should work in portrait or landscape on any iPhone. This probably will not require any work on your part (that’s part of the power of SwiftUI), but be sure to experiment with running on different simulators in Xcode to be sure.✔️

import SwiftUI

struct ContentView: View {
    // i don't think that's a smarte solution
    @State var currentlyDisplayedEmojis = ["🚙","🏎","🚑","🚞","🛵","🚘","🚜","🚓","🚒","💺","🛻","🚀","🛶","🛸"]
    @State var vehiclesEmojis = ["🚙","🏎","🚑","🚞","🛵","🚘","🚜","🚓","🚒","💺","🛻","🚀","🛶","🛸"]
    @State var airplanesEmojis = ["✈️","🛩","🚁","🚀","🛰","🛫","🛬","🛸"]
    @State var flagsEmojis = ["🏴","🏳️‍🌈","🇩🇪","🇫🇮","🇬🇷","🇬🇵","🇮🇩","🇪🇸","🏁"]

    @State var emojiCount = 8
    
    var body: some View {
        VStack{
            HStack{
                Text("Memorize").font(.largeTitle)
            }
            .padding()
            .font(.largeTitle)
            Spacer()
            
                    ScrollView{
                        LazyVGrid(columns: [GridItem(.adaptive(minimum:65))])
                    {
                        ForEach(currentlyDisplayedEmojis[0..<emojiCount], id: \.self) {
                            emoji in CardView (content: emoji).aspectRatio(2/3, contentMode:.fit)
                                }
                        }
                    }.foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                    Spacer()
                    
                    HStack{
                        Vehicles
                        Spacer()
                        Airplanes
                        Spacer()
                        Flags
                    }
                    .padding(.horizontal)
                    .font(.title)
                }
                .padding(.horizontal)
                
            
    }
    
    var Vehicles : some View {
            Button(action:  {
                currentlyDisplayedEmojis = vehiclesEmojis
            }, label: {
                VStack{
                Image(systemName: "car.fill")
                    Text("Vehicles")
                        .font(.footnote)
                }
                
            })
        }
    var Airplanes : some View {
            Button(action:  {
                currentlyDisplayedEmojis = airplanesEmojis
            }, label: {
                VStack{
                Image(systemName: "airplane")
                Text("Airplans")
                        .font(.footnote)
                }
            })
        }
    var Flags : some View {
            Button(action:  {
               currentlyDisplayedEmojis = flagsEmojis
            }, label: {
                VStack{
                Image(systemName: "flag.fill")
                Text("Flags")
                        .font(.footnote)
                }
            })
        }
    }


// card!

struct CardView: View {
    var content : String
   @State var isFaceUp : Bool = true
    
    var body : some View {
        let shape = RoundedRectangle(cornerRadius: 25.0)
        ZStack {
        if isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3.0)
            Text(content).font(.largeTitle)
        } else {
            shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
