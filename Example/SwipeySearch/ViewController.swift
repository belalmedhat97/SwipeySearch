//
//  ViewController.swift
//  SwipeySearch
//
//  Created by belalmedhat97 on 07/31/2022.
//  Copyright (c) 2022 belalmedhat97. All rights reserved.
//

import UIKit
import SwipeySearch
class ViewController: UIViewController {

    @IBOutlet weak var searchView: SwipeySearchView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let searchView = SwipeySearchView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
//        searchView.delegate = self
//        searchView.backgroundColor = .white
//        searchView.isButtonCircle = true
//        searchView.buttonCorner = 10
//        searchView.buttonIcon = UIImage(named: "icons8-search-24")
//        searchView.buttonIconColor = .gray
//        searchView.buttonColor = .black
//        searchView.fieldPlaceHolderTxt = "Search"
//        searchView.fieldPlaceHolderColor = .gray
//        searchView.searchFieldBgColor = .white
//        searchView.searchFieldFontColor = .black
//        searchView.shadowColor = .blue
//        self.view.addSubview(searchView)


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController:SwipeySearchProtocol{
    func handleDidPressSearch(textValue: String) {
        print("text press\(textValue)")
    }
    
    func handleDidChangeText(textValue: String) {
        print("text change\(textValue)")

    }
    
    
}
