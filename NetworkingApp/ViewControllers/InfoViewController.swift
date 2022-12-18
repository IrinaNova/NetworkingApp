//
//  InfoViewController.swift
//  NetworkingApp
//
//  Created by Irunchik on 18.12.22.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = NetworkManager.shared.fetchInfo(url: Link.fullInfo.rawValue)
        

        
    }
    

    

}
