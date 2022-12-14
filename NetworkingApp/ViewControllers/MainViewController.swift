//
//  ViewController.swift
//  NetworkingApp
//
//  Created by Irunchik on 13.12.22.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBAction func getJSON() {
        guard let url = URL(string: "https://www.boredapi.com/api/activity") else {return} //"https://apod.nasa.gov/apod/image/2212/SkyArt_Cobianchi_1024.jpg") else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let info = try JSONDecoder().decode(Activity.self, from: data)
                print (info)
            } catch let error {
                print(error)
            }
            
            
        }.resume()
    }
}

