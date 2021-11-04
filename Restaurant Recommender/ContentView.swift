//
//  ContentView.swift
//  Restaurant Recommender
//
//  Created by Thomas Smith on 9/16/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("hello")
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home(resList: restaurants)
    }
}


struct Home : View {
    @State var isPresented = false
    @State private var searchItems: String = ""
    var resList:[Restaurant]
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    init(resList: [Restaurant]) {
        UITableViewCell.appearance().backgroundColor = .white
        self.resList = resList
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("WolverEats")
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundColor(Color("blue"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                Spacer()
            }.padding(.top, 50)
            
            //                HStack{
            //                    HStack{
            //                        Image(systemName: "magnifyingglass")
            //                            .foregroundColor(Color("blue")).font(.system(size: 18, weight: .semibold)).padding(.leading,15)
            ////                        TextField("Search", text: $search).padding(.horizontal,2).frame(height: UIScreen.main.bounds.height/19, alignment: .center)
            //
            //                    }.background(Color("maize")).cornerRadius(25).padding(.leading,15)
            //
            //                    Image(systemName: "line.horizontal.3.decrease.circle")
            //                        .foregroundColor(Color("maize"))
            //                        .font(.system(size: 33))
            //                        .padding(.horizontal,5)
            //                        .padding(.trailing, 8)
            //                }
            //
            //            ScrollView(.vertical, showsIndicators: false){
            //                VStack{
            //                    HStack{
            //                    Text("Restaurant Name").foregroundColor(Color("blue")).font(.title3).fontWeight(.semibold).padding().frame(maxWidth: .infinity, alignment: .leading)
            //                    Spacer()
            //
            //                        Image(systemName: "star") //star changes to fill when favorited
            //                            .foregroundColor(Color("maize"))
            //                            .padding(.trailing)
            //                            .font(.system(size:20))
            //                    }
            //                    Spacer()
            //                }.frame(width: UIScreen.main.bounds.width/1.1, height: UIScreen.main.bounds.height / 5).background(Color("maize").opacity(0.4)).cornerRadius(20).padding(.top,20)
            //            }
            
            
            //  /Users/angelinailijevski/Desktop/restaurant-recommender/Restaurant Recommender/ModelData.swift          ScrollView(.vertical, showsIndicators: false){
            //                LazyVGrid(columns: columns, spacing: 20){
            //                    //change for uppercase and lowercase?
            //                    ForEach(mData.filter({"\($0)".contains(search) || search.isEmpty})){ i in
            //                        Text(i.title)
            //                            .padding(.all, 30)
            //                            .foregroundColor(.white)
            //
            //                    }
            //                }
            //
            //            }
            HStack{
                SearchBar(text: $searchItems).offset(y: -8)
                Image(systemName: "line.horizontal.3.decrease.circle")
                    .foregroundColor(Color("blue"))
                    .font(.system(size: 25))
                    .padding(.trailing, 8)
                    .offset(y: -8)
            }
            List() {
                ForEach(self.resList.filter({"\($0)".contains(self.searchItems) || self.searchItems.isEmpty})) { r in
                    
                    HStack {
                        HStack(spacing: 20) {
                            Image(systemName: "star")
                                .foregroundColor(.white)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(r.Name).bold()
                                    .foregroundColor(.white)
                                Text(r.Phone).font(.footnote)
                                    .foregroundColor(.white)
                                Text(r.Address)
                                    .font(.footnote)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                    }.listRowBackground(Color("blue"))
                        .onTapGesture {
                            isPresented.toggle()
                            
                        }.sheet(isPresented: $isPresented){
                            openView()
                        }
                }
                
            }
            HStack(spacing: 50){
                
                Image(systemName: "house.fill")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("blue"))
                    .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/28)
                    .padding(.top, 10)
                    .onTapGesture{
                        //change view to home view
                        //fill icon
                    }
                
                Image(systemName: "star")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("blue"))
                    .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/28)
                    .padding(.top, 10)
                    .onTapGesture {
                        //change view to favorites
                        //fill icon
                    }
                Image(systemName: "person")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("blue"))
                    .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/28)
                    .padding(.top, 10)
                    .onTapGesture {
                        //change view to person profile
                        //fill icon
                        
                    }
                
            }.offset(y: -10).frame(height: UIScreen.main.bounds.height/15).padding(.bottom,5)
            
            
        }.background(Color.white).edgesIgnoringSafeArea(.all)// blue background
        
        
    }
}

struct openView : View {
    var body: some View{
        Text("hello") //replace with detail view
    }
}
struct MyData: Identifiable {
    var id = UUID()
    var title: String
}

var mData = [
    
    MyData(title: "Savas"),
    MyData(title: "Stray Hen"),
    MyData(title: "aMa Bistro")
    
]

