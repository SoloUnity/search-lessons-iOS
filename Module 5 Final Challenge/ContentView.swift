//
//  ContentView.swift
//  Module 5 Final Challenge
//
//  Created by Gordon Ng on 2022-07-05.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:ContentModel
    
    @State var searchText:String = ""
    
    var body: some View {
        VStack{
            
            
            NavigationView{
                VStack{
                    SearchBar(text: $searchText)
                        .padding(.top, -30)
                    
                    List(model.searchResults.filter({ searchText.isEmpty ? true : $0.title.contains(searchText) })) { item in
                        NavigationLink {
                            ContentDetailView(searchResults: item)
                        } label: {
                            Text(item.title)
                        }
                    }
                }
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
