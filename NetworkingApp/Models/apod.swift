//
//  apod.swift
//  NetworkingApp
//
//  Created by Irunchik on 13.12.22.
//

struct Apod: Decodable {
    let copyright: String
    let date: String
    let explanation: String
    let hdurl: String
    let media_type: String
    let title: String
}
struct Activity: Decodable {

      let activity: String
      let type: String
      let participants: Int
      let price: Double
      let link:String
      let key: String
      let accessibility: Double

}
