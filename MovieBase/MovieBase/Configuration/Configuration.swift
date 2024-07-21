//
//  Configuration.swift
//  MovieBase
//
//  Created by Ajin on 10/07/24.
//

import Foundation

struct Strings{
    static let configPlist = "App-Config"
    static let plist = "plist"
}

struct Config{
    var appUrl: String = ""
    var apiToken: String = ""
    var imgBaseUrl: String = ""
    var apiKey: String = ""
    init(){
        if let configFile = Bundle.main.path(forResource: Strings.configPlist, ofType: Strings.plist){
            let fileUrl = URL(filePath: configFile)
            if let details = try? NSDictionary(contentsOf: fileUrl, error: ()) as? [String: Any]{
                self.appUrl = details["App_Base_Url"] as? String ?? ""
                self.apiToken = details["api_token"] as? String ?? ""
                self.imgBaseUrl = details["api_image_base_url"] as? String ?? ""
                self.apiKey = details["api_key"] as? String ?? ""
            }
        }
    }
}
