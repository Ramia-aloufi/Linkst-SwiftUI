//
//  StoryViewModel.swift
//  Linkst
//
//  Created by ramia n on 25/04/1447 AH.
//

import Foundation


class StoryViewModel: ObservableObject {
    
    static let shared = StoryViewModel()
    
    private let service: StoryService
    
    private init(srevice: StoryService = StoryServiceImp()) {
        self.service = srevice
    }
    
    @Published private(set) var state: AppState<[UserStories]> = .idle
    @Published private(set) var selectedStory: [Story] = []

    
    
    func fetchStories() async {
        state = .loading
        do {
            let stories = try await service.getLatestStory()
            print(stories)
            if(stories.isEmpty){
                state = .empty
            }else{
                state = .data(stories)
            }
        } catch let apiError as APIError {
            state = .error(apiError.errorDescription ?? "Something went wrong")
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    func setSelectedStory(_ story: [Story]) {
        self.selectedStory = story
    }
}
