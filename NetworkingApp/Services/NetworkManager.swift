//
//  NetworkManager.swift
//  NetworkingApp
//
//  Created by Irunchik on 18.12.22.
//

import Foundation
enum Link: String {
    case imageURL = "https://apod.nasa.gov/apod/image/2212/25BrightestStars_Jittasaiyapan_1500.jpg"
    case fullInfo = "https://go-apod.herokuapp.com/apod"
}
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}
class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchImage(from url: String?, completion: @escaping(Result<Data, NetworkError>)  -> Void ) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    func fetchInfo(url: String) -> String {
        guard let url = URL(string: url) else {return ""}
      
        var fullInfo = ""
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let info = try JSONDecoder().decode(Apod.self, from: data)
                fullInfo = info.explanation
                print (info)
            } catch let error {
                print(error)
            }
 
        }.resume()
       return fullInfo
    }
}
        
    

