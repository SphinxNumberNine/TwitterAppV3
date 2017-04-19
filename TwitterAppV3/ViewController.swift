//
//  ViewController.swift
//  Test3
//
//  Created by Chitra Ramaswamy on 4/16/17.
//  Copyright © 2017 Chitra Ramaswamy. All rights reserved.
//
//  Testing

import UIKit
import TwitterKit


class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logInButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                let alert = UIAlertController(title: "Logged In", message: "User \(unwrappedSession.userName) has logged in",preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                //self.label.text = unwrappedSession.userName
                
                let client = TWTRAPIClient()
                let statusesShowEndpoint = "https://api.twitter.com/1.1/followers/list.json"
                let params = ["user_id": unwrappedSession.userID]
                var clientError : NSError?
                
                let request = client.urlRequest(withMethod: "GET", url: statusesShowEndpoint, parameters: params, error: &clientError)
                
                client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
                    if connectionError != nil {
                        print("Error: \(connectionError)")
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

