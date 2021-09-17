//
//  ContentView.swift
//  Restaurant Recommender
//
//  Created by Thomas Smith on 9/16/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home : View {
    var body: some View {
        VStack{
            HStack{
                Text("WolverEats")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.leading,25)
                Spacer()
                Circle()
                    .foregroundColor(Color("maize"))
                    .frame(width: 40, height: 40)
                    .overlay(
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 20))
                    )
                    .padding(.trailing,20)
            }.padding(.top, 5)
            
            Spacer()
        
        }// blue background
    }
}
