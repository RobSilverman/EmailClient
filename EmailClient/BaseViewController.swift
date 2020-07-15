//
//  ViewController.swift
//  EmailClient
//
//  Created by Robert Silverman on 7/11/20.
//  Copyright © 2020 Robert Silverman. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var tableViewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        searchBar.layer.cornerRadius = searchBar.frame.height / 2
        tableViewContainer.clipsToBounds = true
        tableViewContainer.layer.cornerRadius = 20.0
        if let searchText = searchBar.value(forKey: "searchField") as? UITextField {
            searchText.backgroundColor = UIColor(red: 0.44, green: 0.61, blue: 0.89, alpha: 1)
            searchText.textColor = UIColor.white
        }
    }


}

