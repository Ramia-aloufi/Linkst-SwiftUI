//
//  NewPost.swift
//  Linkst
//
//  Created by ramia n on 22/04/1447 AH.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct NewPost: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = PostViewModel.shared
    //    NewPost Items
    @State var content:String = ""
    @State var selectedItem:PhotosPickerItem? = nil
    @State var selectedImage:UIImage? = nil
    //    Toast
    @State private var showToast = false
    @State private var toastMessage = ""
    @State private var toastColor = Color.green
    
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
            let loading: Bool = {
                if case .loading = viewModel.newPost {
                    return true
                } else {
                    return false
                }
            }()
            DSButton(loading ? "Posting..." : "Post",isLoading: loading){
                Task{
                   await  createPost()
                }
                
                
            }
            Spacer()
            
        }.padding(.horizontal)
            .toast(isPresented: $showToast, message: toastMessage, backgroundColor: toastColor)
    }
    @MainActor
    func createPost() async {
        let files: [String: UploadFile]? = {
            if let uploadFile = selectedImage {
                return ["media": .image(uploadFile)]
            } else {
                return nil
            }
        }()
        var parameters: [String: String] = [:]
        if !content.isEmpty{
            parameters["content"] = content
        }
        let body = Data.createMultipartFormData(parameters: parameters, files:files)
        
        await viewModel.createNewPost(data: body)

        switch viewModel.newPost {
        case .data:
            resetForm()
            toastMessage = "Post added successfully!"
            toastColor = .green
            showToast = true
            
            // Auto dismiss after 1.5 seconds
            try? await Task.sleep(nanoseconds: 1_500_000_000)
            dismiss()
            
        case .error(let msg):
            toastMessage = msg
            toastColor = .red
            showToast = true
            
        case .loading, .empty, .idle:
            break
            
        }
        func resetForm() {
            selectedItem = nil
            selectedImage = nil
            content = ""
        }
    }
}

#Preview {
    NewPost()
}
