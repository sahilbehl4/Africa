//
//  VIdeoPlayerVIew.swift
//  Africa
//
//  Created by Sahil Behl on 2021-09-19.
//

import SwiftUI
import AVKit

struct VIdeoPlayerVIew: View {
    let videoSelected: String
    let videoTitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: getPlayer(for: videoSelected)) {
            }.overlay(
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                ,alignment: .topLeading
            )
        }
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
    
    func getPlayer(for fileName: String)  -> AVPlayer? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: ".mp4") {
            let player = AVPlayer(url: url)
            player.play()
            return player
        }
        return nil
    }
}

struct VIdeoPlayerVIew_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VIdeoPlayerVIew(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
