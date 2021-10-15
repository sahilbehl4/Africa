//
//  VideoListView.swift
//  Africa
//
//  Created by Sahil Behl on 2021-09-10.
//

import SwiftUI

struct VideoListView: View {
    @State private var videos: [Video] = (try? Bundle.main.decode(from: "videos")) ?? []
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(
                        destination: VIdeoPlayerVIew(videoSelected: video.id, videoTitle: video.name)) {
                        VideoListItem(videoItem: video)
                            .padding(.vertical, 8)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
