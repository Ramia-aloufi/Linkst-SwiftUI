//
//  PostViewModel.swift
//  Linkst
//
//  Created by ramia n on 18/03/1447 AH.
//

import Foundation



@MainActor
final class PostViewModel: ObservableObject {
    
    static let shared = PostViewModel()
    
    @Published private(set) var state: AppState<PostResponse> = .idle
    @Published private(set) var userPosts: AppState<[UserPosts]> = .idle
    @Published private(set) var newPost: AppState<Bool> = .idle

    private let service:PostService
    
    private init(service:PostService = PostServiceImp()) {
        self.service = service
        Task { await fetchPosts() }
    }
    
    func fetchPosts() async {
        state = .loading
        do {
            let response = try await service.allPosts()
            if response.content.isEmpty {
                state = .empty
            } else {
                state = .data(response)
            }
        } catch let apiError as APIError {
            state = .error(apiError.errorDescription ?? "Something went wrong")
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
    func fetchUserPosts() async {
        userPosts = .loading
        do {
            let response = try await service.getUserPosts()
            print(response)
            if response.count == 0 {
                userPosts = .empty
            } else {
                userPosts = .data(response)
            }
        } catch let apiError as APIError {
            state = .error(apiError.errorDescription ?? "Something went wrong")
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
    func createNewPost(data:Data) async {
        print("Creating new post")
        newPost = .loading
        do{
            let response = try await service.createPost(data)
            print(response)
            if response.media != nil {
                newPost = .data(true)
                switch self.userPosts {
                case .data(var posts):
                    posts.append(response)
                default:
                    break
                }
            }
        } catch let apiError as APIError {
            state = .error(apiError.errorDescription ?? "Something went wrong")
        } catch {
            state = .error(error.localizedDescription)
        }
        
    }
    
}


