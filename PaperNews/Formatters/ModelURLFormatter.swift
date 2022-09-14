//
//  ModelURLFormatter.swift
//  PaperNews
//
//  Created by pc on 8.09.2022.
//

import Foundation

struct ModelURLFormatter {
    
    let defaultURLImage = "https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc="
    
    func getURL(by urlString: String?) -> URL {
        var finalURL = URL(string: "")
        if let url = urlString {
            finalURL = URL(string: url)!
        }
        return finalURL ?? URL(string: defaultURLImage)!
    }
}
