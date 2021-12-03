//
//  ContentView.swift
//  Restaurant Recommender
//
//  Created by Thomas Smith on 9/16/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    let persistenceController = PersistenceController.shared
        
    var body: some View {
        Home(resList: restaurants).environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home(resList: restaurants)
    }
}


struct Home : View {
    @Environment(\.scenePhase) var scenePhase
//    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var isPresented = false
    //anything that could affect layout of the view -- state reloads that view
    //binding --- can be passed to other views and other views can change it
    @State var currentR : Restaurant? = nil
    @State private var searchItems: String = ""
    var resList:[Restaurant]
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    init(resList: [Restaurant]) {
        UITableViewCell.appearance().backgroundColor = .white
        self.resList = resList
    }
    
//    func isFaved(_ restaurantID: Int) -> Bool{
//        @FetchRequest(
//            entity: Favorite.entity(), sortDescriptors: [], predicate: NSPredicate(format: "restaurantID==@", restaurantID)
//        ) var faved : FetchedResults<Favorite>
//        return !faved.isEmpty
//    }
    
//    func toggleFav(_ restaurantID: Int){
//        if(!isFaved(restaurantID)){
//            let favObj = Favorite();
//            favObj.restaurantID = Int16(restaurantID);
//        }else{
//            @FetchRequest(
//                entity: Favorite.entity(), sortDescriptors: [], predicate: NSPredicate(format: "restaurantID==@", restaurantID)
//            ) var faved : FetchedResults<Favorite>
//            managedObjectContext.delete(faved[0])
//        }
//
//        PersistenceController.shared.save()
//    }
    
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
                            Button(action: {}){
                               Image(systemName: "star")
                                    .foregroundColor(Color("Maize"))
                            }
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
                            currentR = r
                        }
                }
                
            }.sheet(item: $currentR, onDismiss: nil){r in
                DetailView(restaurant: r)
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

