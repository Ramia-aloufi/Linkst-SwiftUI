//
//  ImagePreview.swift
//  Linkst
//
//  Created by ramia n on 17/04/1447 AH.
//

import SwiftUI

struct ImagePreview: View {
    let image: UIImage
    let onRemove: () -> Void
    var body: some View {
            ZStack(alignment: .topTrailing) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue.opacity(0.9))
                    )
                
                Button(action: onRemove) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 24))
                        .padding(8)
                }
            }
            .padding(.trailing, 40)
            .padding(.bottom, 70)
        }
    }

#Preview {
    ImagePreview(image: UIImage(systemName: "photo")!,onRemove: {})
}
