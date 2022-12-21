//
//  apod.swift
//  NetworkingApp
//
//  Created by Irunchik on 13.12.22.
//

struct Apod: Decodable {
    let date: String
    let explanation: String
    let hdUrl: String
    let mediaType: String
    let serviceVersion: String
    let title: String
    let url: String
}
