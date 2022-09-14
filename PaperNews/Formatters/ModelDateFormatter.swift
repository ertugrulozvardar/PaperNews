//
//  ModelDateFormatter.swift
//  PaperNews
//
//  Created by pc on 13.09.2022.
//

import Foundation

struct ModelDateFormatter {
    
    func getPublicationDate(by dateText: String?) -> String {
        var finalPublicationDate = ""
        if let date = dateText {
            let prefixedDate = date.prefix(10)
            finalPublicationDate = finalPublicationDate + prefixedDate
        }
        return finalPublicationDate
    }
}
