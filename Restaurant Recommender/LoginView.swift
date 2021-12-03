//
//  LoginView.swift
//  Restaurant Recommender
//
//  Created by Eli Yazdi on 12/2/21.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var active: Bool = false
    
    func onAppear(){
        active = (Auth.auth().currentUser != nil)
    }
    
    var body: some View {
        if(active){
//            ContentView()
            Home(resList: restaurants)
        }else{
            NavigationView{
                Form{
                    Section{
                        TextField("Email", text: $email)
                        SecureField("Passowrd", text: $password)
                    }
                    
                    Section{
                        Button(action: {
                            Auth.auth().signIn(withEmail: email, password: password){ authResult, error in
                                if let err = error {
                                    print(err)
                                }else{
                                    active = true
                                }
                            }
                        }){
                            Text("Log In")
                        }
                        Button(action:{
                            Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
                                if let err = error {
                                    print(err)
                                }else{
                                    active = true
                                }
                            }
                        }){
                            Text("Create account")
                        }
                    }
                    
                }.navigationTitle("Login")
            }
            .onAppear(perform: onAppear)
            
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
