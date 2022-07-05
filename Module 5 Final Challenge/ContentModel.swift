//
//  ContentModel.swift
//  Module 5 Final Challenge
//
//  Created by Gordon Ng on 2022-07-05.
//

import Foundation

class ContentModel: ObservableObject{
    
    @Published var searchResults = [Videos]()
    
    init(){
        getRemoteData()
    }
    
    func getRemoteData(){
            
            // String path
            let urlString = "https://codewithchris.github.io/Module5Challenge/Data.json"
            
            // URL object
            let url = URL(string: urlString)
            
            guard url != nil else{
                // Couldnt create url
                return
            }
            
            // URLRequest object
            let request = URLRequest(url: url!)
            
            // Get the session and kick off the task
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: request) { data, response, error in
                
                // Check if there is an error
                guard error == nil else{
                    // There was an error
                    return
                }
                // Handle response
                do{
                    let decoder = JSONDecoder()
                    
                    let modules = try decoder.decode([Videos].self, from: data!)
                    
                                    // Let main thread handle UI tasks when it is available
                    DispatchQueue.main.async{
                        self.searchResults += modules
                    }
                }
                catch{
                    // Couldn't parse data
                    print("GG lmao")
                }
                
                
            }
            
            // Kick off data task
            dataTask.resume()
            
        }
    
    
}
