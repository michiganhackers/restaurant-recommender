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
    @State var search = ""
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("WolverEats")
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundColor(Color("maize"))
                Spacer()
            }.padding(.top, 50).background(Color("blue"))
            
                HStack{
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("blue")).font(.system(size: 18, weight: .semibold)).padding(.leading,15)
                        TextField("Search", text: $search).padding(.horizontal,2).frame(height: UIScreen.main.bounds.height/19, alignment: .center)
                    }.background(Color("maize")).cornerRadius(25).padding(.leading,15)
                    
                    Image(systemName: "line.horizontal.3.decrease.circle")
                        .foregroundColor(Color("maize"))
                        .font(.system(size: 33))
                        .padding(.horizontal,5)
                        .padding(.trailing, 8)
                }
                
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    HStack{
                    Text("Restaurant Name").foregroundColor(Color("blue")).font(.title3).fontWeight(.semibold).padding().frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    
                        Image(systemName: "star") //star changes to fill when favorited
                            .foregroundColor(Color("maize"))
                            .padding(.trailing)
                            .font(.system(size:20))
                    }
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width/1.1, height: UIScreen.main.bounds.height / 6).background(Color("maize").opacity(0.4)).cornerRadius(20).padding(.top,20)
            }
            
            
            
            
            Spacer()
            
        }.background(Color("blue")).edgesIgnoringSafeArea(.all)// blue background
    }
}
