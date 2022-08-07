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
    }
    @IBOutlet weak var searchBar: SwipeySearchClass!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        searchBar.searchButton.backgroundColor = .red
        // Dispose of any resources that can be recreated.
    }

}

