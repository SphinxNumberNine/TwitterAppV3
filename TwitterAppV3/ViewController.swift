//
//  ViewController.swift
//  Test3
//
//  Created by Chitra Ramaswamy on 4/16/17.
//  Copyright © 2017 Chitra Ramaswamy. All rights reserved.
//
//  Testing
//  Adding Ashwath branch
//  TEST20000000000

import UIKit
import TwitterKit
import Foundation

var globalIds = [String]()
var globalNames = [String]()
var globalNumberOfMembers = [String]()
var globalPublicOrPrivate = [String]()
var globalNumberOfLists = Int()

class ViewController: UIViewController {
    
    var numberOfLists = 0
    var ids = [AnyObject]()
    var names = [AnyObject]()
    var numberOfMembers = [AnyObject]()
    var publicOrPrivate = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //var tableCount = 0
        let logInButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                /*let alert = UIAlertController(title: "Logged In", message: "User \(unwrappedSession.userName) has logged in",preferredStyle: UIAlertControllerStyle.alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
                    (result : UIAlertAction) -> Void in
                    self.performSegue(withIdentifier: "segueone", sender: self)
                }
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)*/
                
                
                let client = TWTRAPIClient()
                let statusesShowEndpoint = "https://api.twitter.com/1.1/lists/list.json"
                let params = ["user_id": unwrappedSession.userID]
                var clientError : NSError?
                                
                let request = client.urlRequest(withMethod: "GET", url: statusesShowEndpoint, parameters: params, error: &clientError)
                
                client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
                    if connectionError != nil {
                        print("Error: \(String(describing: connectionError))")
                    }
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
                        let jsonarray = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String: AnyObject]]
                        for x in json{
                            self.numberOfLists += 1
                        }
                        for y in jsonarray{
                            self.ids.append(y["id"]!)
                            self.names.append(y["name"]!)
                            self.numberOfMembers.append(y["member_count"]!)
                            self.publicOrPrivate.append(y["mode"]!)
                        }
                        
                        let parser = JsonParser(numberOfLists: self.numberOfLists, ids: self.ids, names: self.names, numberOfMembers: self.numberOfMembers, publicOrPrivate: self.publicOrPrivate)
                        
                        globalIds = parser.getIds()
                        globalNames = parser.getNames()
                        globalNumberOfMembers = parser.getNumbersOfMembers()
                        globalPublicOrPrivate = parser.getPublicOrPrivate()
                        globalNumberOfLists = parser.getNumberOfLists()
                        
                        print("json: \(json)")
                                                
                        //self.performSegue(withIdentifier: "segueone", sender: self)
                        let alert = UIAlertController(title: "Logged In", message: "User \(unwrappedSession.userName) has logged in",preferredStyle: UIAlertControllerStyle.alert)
                        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
                            (result : UIAlertAction) -> Void in
                            self.performSegue(withIdentifier: "segueone", sender: self)
                        }
                        alert.addAction(okAction)
                        self.present(alert, animated: true, completion: nil)
                        
                    } catch let jsonError as NSError {
                        print("json error: \(jsonError.localizedDescription)")
                    }
                }
                

                
            } else {
                NSLog("Login error: %@", error!.localizedDescription);
            }
        }
        
        // TODO: Change where the log in button is positioned in your view
        if let button = Optional(logInButton) {
            button.center = self.view.center
            self.view.addSubview(button)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueone"{
            let vc = segue.destination as! ListsTableViewController
            
            vc.listNames = globalNames
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    }

