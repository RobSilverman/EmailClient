//
//  EmailData.swift
//  EmailClient
//
//  Created by Robert Silverman on 7/18/20.
//  Copyright © 2020 Robert Silverman. All rights reserved.
//

import Foundation

struct Email: Codable {
    var name: String
    var subject: String
    var body: String
    var image: String
    var date: String
    var attachment: String?
    var starred: Bool
    var read: Bool
}

struct Emails: Codable {
    var results: [Email]
}
