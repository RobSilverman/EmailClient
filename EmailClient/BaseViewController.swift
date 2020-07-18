//
//  ViewController.swift
//  EmailClient
//
//  Created by Robert Silverman on 7/11/20.
//  Copyright © 2020 Robert Silverman. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var emails = [Email]()

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var tableViewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEmails()
        setupViews()
    }
    
    func loadEmails() {
        //TODO: add demo of pulling data from http request
        //parse json here
    }
    
    func setupViews() {
        searchBar.backgroundImage = UIImage()
        tableViewContainer.clipsToBounds = true
        tableViewContainer.layer.cornerRadius = 20.0
        if let searchText = searchBar.value(forKey: "searchField") as? UITextField {
            searchText.backgroundColor = UIColor(red: 0.44, green: 0.61, blue: 0.89, alpha: 1)
            searchText.textColor = UIColor.white
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "EmailSegue":
            //configure
            guard let vc = segue.destination as? EmailTableViewController else { return }
            vc.setupViewController(emails)
        default:
            return
        }
    }


}

