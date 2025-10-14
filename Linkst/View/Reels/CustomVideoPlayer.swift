//
//  CustomVideoPlayer.swift
//  Linkst
//
//  Created by ramia n on 15/04/1447 AH.
//

import SwiftUI
import AVKit

struct CustomVideoPlayer: UIViewControllerRepresentable {
    var player: AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.exitsFullScreenWhenPlaybackEnds = true
        controller.allowsPictureInPicturePlayback = true
        controller.videoGravity = .resizeAspect // makes video full screen

        // Add observer: loop video when it ends
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: controller.player?.currentItem,
            queue: .main
        ) { _ in
            controller.player?.seek(to: .zero) { _ in
                controller.player?.play()
            }
        }

        // Start playing immediately
        controller.player?.play()

        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Handle updates if needed (e.g. switching videos)
        uiViewController.player = player
    }
}
