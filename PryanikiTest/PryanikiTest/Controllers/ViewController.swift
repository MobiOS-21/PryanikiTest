//
//  ViewController.swift
//  PryanikiTest
//
//  Created by Александр Дергилёв on 02.02.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    func loadData() {
        ViewDataService.instance.downloadViewsInfo()
        ViewDataService.instance.completionHandler { [weak self] (data, status, message) in
            guard let sself = self else { return }
            if status, let data = data {
                print(data)
            }
        }
    }


}

