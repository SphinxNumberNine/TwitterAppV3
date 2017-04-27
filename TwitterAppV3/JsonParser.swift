//
//  JsonParser.swift
//  TwitterAppV3
//
//  Created by Chitra Ramaswamy on 4/22/17.
//  Copyright © 2017 Chitra Ramaswamy. All rights reserved.
//

import Foundation
import Fabric
import TwitterKit
import UIKit

class JsonParser{
    
    var numberOfLists : Int
    var ids : [AnyObject]
    var names : [AnyObject]
    var numberOfMembers : [AnyObject]
    var publicOrPrivate : [AnyObject]
    
    init(numberOfLists : Int, ids : [AnyObject], names : [AnyObject], numberOfMembers : [AnyObject], publicOrPrivate : [AnyObject]){
        self.numberOfLists = numberOfLists
        self.ids = ids
        self.names = names
        self.numberOfMembers = numberOfMembers
        self.publicOrPrivate = publicOrPrivate
    }
    
    public func getNumberOfLists() -> Int{
        return self.numberOfLists
    }
    
    public func getIds() -> [String]{
        var stringArray = [String]()
        for i in self.ids{
            stringArray.append(String(describing: i))
        }
        return stringArray
    }
    
    public func getNames() -> [String]{
        var stringArray = [String]()
        for i in self.names{
            stringArray.append(String(describing : i))
        }
        return stringArray
    }
    
    public func getNumbersOfMembers() -> [String]{
        var stringArray = [String]()
        for i in self.numberOfMembers{
            stringArray.append(String(describing: i))
        }
        return stringArray
    }
    
    public func getPublicOrPrivate() -> [String]{
        var stringArray = [String]()
        for i in self.publicOrPrivate{
            stringArray.append(String(describing: i))
        }
        return stringArray
    }
    
    public func sendSecondRequest(id: String) -> Data?{
        var data_real : Data?
        let client = TWTRAPIClient()
        let url = "https://api.twitter.com/1.1/lists/members.json"
        let params = ["list_id": id]
        var error : NSError?
        
        let request = client.urlRequest(withMethod: "GET", url: url, parameters: params, error: &error)
        
        client.sendTwitterRequest(request) { (response, data, error) in
            if error != nil{
                
            }
            else{
                data_real = data
            }
        }
        return data_real
    }
    
    public func parseMembersData(data : Data){
        
        do{
            let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any]
            let membersarray = json?["users"] as? [String: Any]
            
        }
        catch let jsonError as NSError{
            print("json error: \(jsonError.localizedDescription)")
        }
    }
    
}

