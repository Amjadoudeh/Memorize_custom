//
//  ContentView.swift
//  Memorize_custom
//
//  Created by Amjad Oudeh on 11.10.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
        CardView(content:"Amjad")
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding()
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
