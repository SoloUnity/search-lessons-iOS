//
//  ContentDetailView.swift
//  Module 5 Final Challenge
//
//  Created by Gordon Ng on 2022-07-05.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    var searchResults:Videos
    
    var body: some View {
        let url = URL(string: searchResults.url)
        
        VStack(alignment:.leading){
            Text(searchResults.title)
                .font(.title)
            
            if url != nil{
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
                    .aspectRatio(CGSize(width: 1920, height: 1080), contentMode: .fit)
            }
            Spacer()
        }
        .padding()
    }
}


