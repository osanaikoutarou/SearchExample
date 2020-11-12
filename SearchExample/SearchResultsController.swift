//
//  SearchResultsController.swift
//  SearchExample
//
//  Created by 長内幸太郎 on 2020/11/12.
//

import UIKit

class SearchResultsController: UIViewController {
    
    var searchTappedClosure: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedGoGreen(_ sender: Any) {
        // 検索候補が押されたとしたら
        searchTappedClosure?()
    }
    

}
