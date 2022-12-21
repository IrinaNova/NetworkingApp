//
//  NetworkManager.swift
//  NetworkingApp
//
//  Created by Irunchik on 18.12.22.
//

import Foundation
import Alamofire

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
    func fetchInfo(url: String, completion: @escaping(Result<Apod, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON {dataResponse in
                switch dataResponse.result{
                case .success(let value):
                    guard let apodData = value as? [String:Any] else {return}
                    let apod = Apod(date: apodData["date"] as? String ?? "",
                                    explanation: apodData["explanation"] as? String ?? "", hdurl: apodData["hdurl"] as? String ?? "", media_type: apodData["media_type"] as? String ?? "", service_version: apodData["service_version"] as? String ?? "", title: apodData["title"] as? String ?? "", url: apodData["url"] as? String ?? "")
                    completion(.success(apod))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
        
     
        
//func fetchInfo(url: String, completion: @escaping(Result<Apod, NetworkError>) -> Void) {
//    guard let url = URL(string: url) else {
//        completion(.failure(.invalidURL))
//        return
//    }
//
//    URLSession.shared.dataTask(with: url) { data, _, error in
//        guard let data else {
//            completion(.failure(.noData))
//            return
//        }
//        do {
////                let decoder = JSONDecoder()
////                decoder.keyDecodingStrategy = .convertFromSnakeCase
//            let info = try JSONDecoder().decode(Apod.self, from: data)
//            DispatchQueue.main.async {
//                completion(.success(info))
//            }
//        } catch {
//            completion(.failure(.decodingError))
//        }
//
//    }.resume()
//}
//}
//
