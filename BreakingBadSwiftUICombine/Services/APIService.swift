//
//  APIService.swift
//  BreakingBadSwiftUICombine
//
//  Created by Павел Черняев on 20.11.2021.
//

import Foundation
import Combine

struct APIService {
    
    private var subscriptions: Set<AnyCancellable> = []
    
    enum Method {
        
        private static let baseURL = URL(string: "https://www.breakingbadapi.com/api/")!
        
        var url: URL {
            switch self {
            case .characters:
                return Self.baseURL.appendingPathComponent("characters")
            case .episodes:
                return Self.baseURL.appendingPathComponent("episodes")
            }
        }

        case characters
        case episodes
    }
    
    enum Error: LocalizedError {
            
         case unreachableAddress(url: URL)
         case invalidResponse
            
         var errorDescription: String? {
             switch self {
             case .unreachableAddress(let url): return "\(url.absoluteString) is unreachable"
             case .invalidResponse: return "Response with mistake"
             }
         }
    }
    
    private let decoder = JSONDecoder()
    private let queue = DispatchQueue(label: "BreakingBadAPIService", qos: .default, attributes: .concurrent)
    
    func getCharacters() -> AnyPublisher<[Character], Error> {
    
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let url = Method.characters.url
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .receive(on: queue)
            .map(\.data)
            .decode(type: [Character].self, decoder: decoder)
            .mapError({ error -> Error in
                switch error {
                case is URLError:
                    return Error.unreachableAddress(url: url)
                default:
                  return Error.invalidResponse }
            })
            .eraseToAnyPublisher()
    }
    
    func getEpisodes() -> AnyPublisher<[Episode], Error> {
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let url = Method.episodes.url
        print(url)
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .receive(on: queue)
            .map(\.data)
            .print("episodes")
            .decode(type: [Episode].self, decoder: decoder)
            .mapError({ error -> Error in
                switch error {
                case is URLError:
                    return Error.unreachableAddress(url: url)
                default:
                    print(error.localizedDescription)
                  return Error.invalidResponse }
            })
            .eraseToAnyPublisher()
    }   
}
