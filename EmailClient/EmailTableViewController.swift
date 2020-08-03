//
//  EmailTableViewController.swift
//  EmailClient
//
//  Created by Robert Silverman on 7/14/20.
//  Copyright © 2020 Robert Silverman. All rights reserved.
//

import UIKit

class EmailTableViewController: UITableViewController {
    
    var emails: [Email] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadEmails()
    }

    // MARK: - Table view data source
    
    func loadEmails() {
        //TODO: add demo of pulling data from http request
        if let filePath = Bundle.main.path(forResource: "emailData", ofType: "json") {
            let url = URL(fileURLWithPath: filePath)
            do {
                let json = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                if let emailData = try? decoder.decode(Emails.self, from: json) {
                    emails = emailData.results
                }
            } catch {
                print(error)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emails.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmailCell", for: indexPath) as? EmailCell else { fatalError("Unable to deque cell") }
        
        let dateString = calculateDisplayedDateTime(for: indexPath)
        cell.timeLabel.text = dateString

        cell.nameLabel.text = emails[indexPath.row].name
        cell.subjectLabel.text = emails[indexPath.row].subject
        cell.bodyLabel.text = emails[indexPath.row].body
        
        
        if emails[indexPath.row].read {
            cell.nameLabel.font = .systemFont(ofSize: 17.0)
            cell.subjectLabel.font = .systemFont(ofSize: 17.0)
        }
        
        if emails[indexPath.row].starred {
            cell.starredImage.image = UIImage(systemName: "star.fill")
            cell.starredImage.tintColor = .systemYellow
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .normal, title: nil, handler: { action, view, completionHandler in
            completionHandler(true)
        })
        
        action.image = UIImage(systemName: "tray.full")
        action.backgroundColor = UIColor.systemGreen
        
        let configuration = UISwipeActionsConfiguration(actions: [action])
        return configuration
    }
    
    func calculateDisplayedDateTime(for indexPath: IndexPath) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-dd-MM-HH:mm"
        
        let dateFromString = dateFormatter.date(from: emails[indexPath.row].date)
        print(dateFromString)
        
        if dateFromString! > Date.init(timeIntervalSinceNow: -86400) {
            dateFormatter.dateFormat = "dd MMM"
        } else {
            dateFormatter.dateFormat = "HH:mm"
        }
        
        let dateString = dateFormatter.string(from: dateFromString!)
        return dateString
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
