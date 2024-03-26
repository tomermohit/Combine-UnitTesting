//
//  NetworkManager.swift
//  Combine+UnitTesting
//
//  Created by ꧁☆༒☬MoʜɩtToɱɘʀ☬༒☆꧂ on 25/03/24.
//

import Foundation
import Combine

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case unknown
}

final class NetworkManager {
    
    private init() {}
    static let shared = NetworkManager()
    
     private let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
     static let appetiserURL = "appetizers"
    private var cancellable = Set<AnyCancellable>()
    
    
    // MARK: - Async Await API Call
    
    /*
    func getAppetisers() async throws -> [Appetiser] {
        
        guard let url = URL(string: appetiserURL) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decoderResponse = try decoder.decode(AppetiserResponse.self, from: data)
            return decoderResponse.request
        }catch {
            throw APError.invalidData
        }
    }
    
    */
    
    // MARK: - Combine API Call
    
    func getAppetiser<T: Decodable>(endPoint: String, type: T.Type) -> Future<T, Error> {
        
        return Future<T, Error> { [weak self] promise in
            
            guard let self = self, let url = URL(string: baseURL.appending(endPoint)) else {
                return promise(.failure(APError.invalidURL))
            }
            debugPrint("My URL: \(url.absoluteString)")
            
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw APError.invalidResponse
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink( receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as APError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(APError.unknown))
                        }
                    }
                }, receiveValue: { value in   // OR receiveValue: { promise(.success($0)) }) --------> single line code use $0 only instead of value
                    promise(.success(value))
                })
                .store(in: &self.cancellable)

        }
    }
    
}
