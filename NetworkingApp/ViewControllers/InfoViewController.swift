//
//  InfoViewController.swift
//  NetworkingApp
//
//  Created by Irunchik on 18.12.22.
//

import UIKit
import Alamofire

class InfoViewController: UIViewController {

    @IBOutlet var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchInfo()
        

        
    }
    private func fetchInfo() {
        NetworkManager.shared.fetchInfo(url: Link.fullInfo.rawValue) { [ weak self] result in
            switch result {
            case .success(let apod):
                self?.infoLabel.text = apod.explanation
            case .failure(let error):
                print(error)
            }
        }
        
     }

    

}
