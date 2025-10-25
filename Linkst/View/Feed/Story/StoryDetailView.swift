//
//  StoryDetailView.swift
//  Linkst
//
//  Created by ramia n on 25/04/1447 AH.
//

import SwiftUI
import Kingfisher
import AVKit

struct StoryDetailView: View {
    let story: [Story] = StoryViewModel.shared.selectedStory
    @Environment(\.dismiss) var dismiss
    
    @State private var currentIndex: Int = 0
    @State private var progress: CGFloat = 0
    @State private var timer: Timer? = nil
    @State private var player: AVPlayer? = nil
    
    @State private var playerObserver: Any? = nil
    @State private var playerStatusObserver: NSKeyValueObservation? = nil
    @State private var endObserver: NSObjectProtocol? = nil
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            let media = story[currentIndex]
            
            Group {
                if media.mediaType.lowercased() == "image" {
                    KFImage(URL(string: media.media))
                        .resizable()
                        .scaledToFit()
                        .onTapGesture {
                            nextStory()
                        }
                } else if media.mediaType.lowercased() == "video" {
                    VideoPlayer(player: player)
                        .scaledToFit()
                        .onTapGesture {
                            nextStory()
                        }

                } else {
                    Color.gray
                }
            }
            .scaledToFit()
            .frame(width: .infinity, height: .infinity)
            .background(Color.black)
            .onAppear { setupCurrentStory() }
            .onDisappear { cleanup() }

            
            // Progress bars
            VStack {
                HStack(spacing: 4) {
                    ForEach(0..<story.count, id: \.self) { index in
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(.white.opacity(0.5))
                                if index < currentIndex {
                                    Rectangle().foregroundColor(.white)
                                } else if index == currentIndex {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: geo.size.width * progress)
                                }
                            }
                            .cornerRadius(2)
                        }
                        .frame(height: 4)
                    }
                }
                .padding(.horizontal, 8)
                .padding(.top, 40)
                Spacer()
            }
        }
        .onChange(of: currentIndex) { _,_ in setupCurrentStory() }
    }
    
    // MARK: - Setup Story
    func setupCurrentStory() {
        cleanup()
        progress = 0
        let media = story[currentIndex]
        
        if media.mediaType.lowercased() == "video", let url = URL(string: media.media) {
            player = AVPlayer(url: url)
            
            // Observe player status
            playerStatusObserver = player?.currentItem?.observe(\.status, options: [.initial, .new]) {item, _ in
                if item.status == .readyToPlay {
                    startVideoProgress()
                    player?.play()
                    observeVideoEnd(item: item)
                }
            }
        } else {
            startImageTimer()
        }
    }
    
    func observeVideoEnd(item: AVPlayerItem) {
        endObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: item,
            queue: .main
        ) { _ in
            nextStory()
        }
    }
    
    // MARK: - Timers
    func startImageTimer() {
        stopTimer()
        let duration: Double = 5
        let interval: Double = 0.05
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) {  t in
            progress += CGFloat(interval / duration)
            if progress >= 1 { nextStory() }
        }
    }
    
    func startVideoProgress() {
        guard let player = player,
              let duration = player.currentItem?.duration.seconds,
              duration.isFinite else {
            startImageTimer()
            return
        }
        stopTimer()
        progress = 0
        
        playerObserver = player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.05, preferredTimescale: 600),queue: .main) { time in
            progress = min(max(CGFloat(time.seconds / duration), 0), 1)
        }
    }
    
    // MARK: - Next Story
    func nextStory() {
        cleanup()
        if currentIndex < story.count - 1 {
            currentIndex += 1
        } else {
            dismiss()
        }
    }
    
    // MARK: - Cleanup
    func cleanup() {
        stopTimer()
        if let observer = playerObserver {
            player?.removeTimeObserver(observer)
            playerObserver = nil
        }
        playerStatusObserver?.invalidate()
        playerStatusObserver = nil
        if let endObs = endObserver {
            NotificationCenter.default.removeObserver(endObs)
            endObserver = nil
        }
        player?.pause()
        player = nil
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}




#Preview {
    StoryDetailView()
}
