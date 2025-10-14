//
//  NewPost.swift
//  Linkst
//
//  Created by ramia n on 22/04/1447 AH.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct NewPost: View {
    @ObservedObject var viewModel = PostViewModel.shared

    @State var content:String = ""
    @State var selectedItem:PhotosPickerItem? = nil
    @State var selectedImage:UIImage? = nil
    var body: some View {
        VStack(alignment: .leading,spacing: 24){
            Spacer()
            DSText("New Post", font: .title)

            if let selected = selectedImage{
                Image(uiImage: selected)
                    .resizable()
                    .frame(width: .infinity,height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            TextEditor(text: $content)
                .frame(height: 150)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
            PhotosPicker(selection: $selectedItem) {
                HStack(alignment: .center){
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 32, height: 32)
                    DSText("Add Media")
                }

            }
            .onChange(of: selectedItem) { _, newValue in
                Task {
                    if let data = try? await newValue?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        selectedImage = uiImage
                    }
                }
            }
            DSButton("Post"){
                
                let files: [String: UploadFile]? = {
                    if let uploadFile = selectedImage {
                        return ["image": .image(uploadFile)]
                    } else {
                        return nil
                    }
                }()
                
                var parameters: [String: String] = [:]
                if !content.isEmpty{
                        return parameters["content"] = content
                    }
                
                let body = Data.createMultipartFormData(parameters: parameters, files:files)
               Task{
                   await viewModel.createNewPost(data: body)
                }
                
                print("parameters: \(parameters)")
                print("files: \(files ?? [:])")
                
                
            }
            Spacer()
            
        }.padding(.horizontal)
    }
}

#Preview {
    NewPost()
}
