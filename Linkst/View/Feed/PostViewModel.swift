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
    
    @Published private(set) var state: AppState<PostResponse> = .loading
    @Published private(set) var userPosts: AppState<[UserPosts]> = .loading
    @Published private(set) var newPost: AppState<UserPosts> = .loading

    private let service:PostService
    
    private init(service:PostService = PostServiceImp()) {
        self.service = service
        Task { await fetchPosts()
                }
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
        print("fetchUserPosts")
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
        newPost = .loading
        do{
            let response = try await service.createPost(data)
            if response.media != nil {
                newPost = .data(response)
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


