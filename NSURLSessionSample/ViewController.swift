//
//  ViewController.swift
//  NSURLSessionSample
//
//  Created by Ramesh Ramesh on 3/20/17.
//  Copyright © 2017 Ramesh Ramesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        callWebService()
    }
    //http://demo2410337.mockable.io/urlSession
    
    func callWebService() {
        // Show MBProgressHUD Here
        var config                              :URLSessionConfiguration!
        var urlSession                          :URLSession!
        
        config = URLSessionConfiguration.default
        urlSession = URLSession(configuration: config)
        let past = ("asd",5)
        
        // MARK:- HeaderField
        let HTTPHeaderField_ContentType         = "Content-Type"
        
        // MARK:- ContentType
        let ContentType_ApplicationJson         = "application/json"
        
        //MARK: HTTPMethod
        let HTTPMethod_Get                      = "GET"

        
        
        let callURL = URL.init(string: "https://itunes.apple.com/in/rss/newapplications/limit=10/json")
        
        var request = URLRequest.init(url: callURL!)
        
        request.timeoutInterval = 60.0 // TimeoutInterval in Second
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        request.addValue(ContentType_ApplicationJson, forHTTPHeaderField: HTTPHeaderField_ContentType)
        request.httpMethod = HTTPMethod_Get
        
        let dataTask = urlSession.dataTask(with: request) { (data,response,error) in
            if error != nil{
                return
            }
            do {
                let resultJson = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]
                print("Result",resultJson!)
            } catch {
                print("Error -> \(error)")
            }
        }
        
        dataTask.resume()
    }

}

