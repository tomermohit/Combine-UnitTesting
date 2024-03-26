//
//  AppetiserViewModel.swift
//  Combine+UnitTesting
//
//  Created by ꧁☆༒☬MoʜɩtToɱɘʀ☬༒☆꧂ on 25/03/24.
//

import Foundation
import Combine


@MainActor final class AppetiserViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var appetiser: [Appetiser] = []
    @Published var selectedAppetiser: Appetiser?
    @Published var isShowingDetailView: Bool = false
    @Published var alertItem: AlertItem?
    private var cancellable = Set<AnyCancellable>()
    
  
    // MARK: - Async Await API Call
    
    /*
     
    func getAppetiserList() {
        isLoading = true
        Task {
            do {
                appetiser = try await NetworkManager.shared.getAppetisers()
                dump(appetiser)
                isLoading = false
            }catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    }
                }else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
     
     */
    
    // MARK: - Combine API Call
    
    func getAppetiserList() {
        isLoading = true
        NetworkManager.shared.getAppetiser(endPoint: NetworkManager.appetiserURL, type: AppetiserResponse.self)
            .sink { [weak self] completions in
                switch completions {
                case .failure(let error):
                    self?.alertItem = AlertContext.invalidResponse
                    debugPrint("Error is: \(error.localizedDescription)")
                    self?.isLoading = false
                case .finished:
                    debugPrint("Finished")
                    self?.isLoading = false
                }
            } receiveValue: { [weak self] appetiser in
                dump(appetiser)
                self?.appetiser = appetiser.request
                self?.isLoading = false
            }
            .store(in: &cancellable)

    }
    
}
