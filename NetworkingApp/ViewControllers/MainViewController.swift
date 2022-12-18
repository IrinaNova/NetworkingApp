//
//  ViewController.swift
//  NetworkingApp
//
//  Created by Irunchik on 13.12.22.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBAction func getJSON() {
        guard let url = URL(string: "https://go-apod.herokuapp.com/apod") else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let info = try JSONDecoder().decode(Apod.self, from: data)
                print (info)
            } catch let error {
                print(error)
            }
            
            
        }.resume()
    }
}

