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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        searchBar.searchButton.backgroundColor = .red
//        searchBar.searchButton.defineShape(type: .roundedSquare(corner: 10))
        searchBar.buttonShape(type: .roundedSquare(corner: 5))

    }
    @IBOutlet weak var searchBar: SwipeySearchClass!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

