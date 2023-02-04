//
//  SearchViewController.swift
//  PlateMate
//
//  Created by HE Siyao on 3/2/2023.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getRequest(_ sender: UIButton) {
        let url = URL(string: "http://20.14.97.80")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
    

}
