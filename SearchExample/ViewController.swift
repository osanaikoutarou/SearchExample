//
//  ViewController.swift
//  SearchExample
//
//  Created by 長内幸太郎 on 2020/11/12.
//

import UIKit

//参考: https://dev.classmethod.jp/articles/ios-11-uinavigationitem-searchcontroller/

class ViewController: UIViewController {
    
    // ナビゲーションバーに検索を出すやつ
    private var searchController: UISearchController!
    // 検索結果を随時表示する画面
    private var searchResultsController: SearchResultsController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Storyboardから読み込む
        searchResultsController = self.storyboard?.instantiateViewController(identifier: "SearchResultsController") as? SearchResultsController
        // サジェスト側で何か候補を押したとき
        searchResultsController.searchTappedClosure = {
            // 遷移してから
            self.performSegue(withIdentifier: "GreenA", sender: nil)
            // フォーカスを外す（そうしないと戻った時にまたキーボードが出てくる）
            self.searchController.isActive = false
        }
        
        // SearchControllerを設定する
        searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.obscuresBackgroundDuringPresentation = false
        // 検索結果updater
        searchController.searchResultsUpdater = self

        // テキストバーの見た目をカスタマイズする
//        searchController.searchBar.searchTextField.backgroundColor = .lightGray
        searchController.searchBar.searchTextField.textColor = .darkGray
        searchController.searchBar.searchTextField.font = UIFont.systemFont(ofSize: 15)
        searchController.searchBar.placeholder = "検索"
        searchController.searchBar.delegate = self
 
        // これを設定しないと崩れが生じる
        definesPresentationContext = true

        // navigationItemに反映
        navigationItem.searchController = searchController
        navigationItem.title = "タイトル"
        // trueだとスクロールした時にSearchBarを隠す（デフォルトはtrue）
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

extension ViewController: UISearchResultsUpdating {
    // 検索のTextFieldの内容が変化した時に呼ばれる
    func updateSearchResults(for searchController: UISearchController) {
        if let keyword = searchController.searchBar.text, !keyword.isEmpty {
            print(#line, keyword)
        }
        else {
            // 検索結果画面を表示する
            self.searchController.showsSearchResultsController = true
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("検索ボタン押されたよ ", searchBar.text!)
        
        self.performSegue(withIdentifier: "GreenA", sender: nil)
    }
}
