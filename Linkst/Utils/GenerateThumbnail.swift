//
//  GenerateThumbnail.swift
//  Linkst
//
//  Created by ramia n on 26/04/1447 AH.
//

import AVFoundation
import UIKit
@MainActor
func generateThumbnail(from url: URL) async -> UIImage? {
    let asset = AVURLAsset(url: url)
    let generator = AVAssetImageGenerator(asset: asset)
    generator.appliesPreferredTrackTransform = true
    generator.requestedTimeToleranceBefore = .zero
    generator.requestedTimeToleranceAfter = CMTime(seconds: 2, preferredTimescale: 600)
    do {
        let img = try await generator.image(at: .zero).image
        return UIImage(cgImage: img)
    } catch {
        print("Error generating thumbnail: \(error)")
        return nil
    }
}
