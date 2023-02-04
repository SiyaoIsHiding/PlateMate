//
//  SearchViewController.swift
//  PlateMate
//
//  Created by HE Siyao on 3/2/2023.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel.text = "yo"
        logo.image = UIImage(named: "platemateLogo")
        
    }
}
