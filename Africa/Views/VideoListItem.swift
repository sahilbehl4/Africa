//
//  VideoListItem.swift
//  Africa
//
//  Created by Sahil Behl on 2021-09-19.
//

import SwiftUI

struct VideoListItem: View {
    let videoItem: Video
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image("video-\(videoItem.id)")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(videoItem.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(videoItem.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static let videoItems: [Video] = try! Bundle.main.decode(from: "videos")
    
    static var previews: some View {
        VideoListItem(videoItem: videoItems.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
