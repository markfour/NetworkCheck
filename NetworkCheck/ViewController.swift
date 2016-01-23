//
//  ViewController.swift
//  NetworkCheck
//
//  Created by HayashidaKazumi on 2016/01/23.
//  Copyright © 2016年 HayashidaKazumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBAction func onTcpTap(sender: AnyObject) {
    print("")
    
    guard let url = NSURL(string: "http://127.0.0.1:80") else { return }
    let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    let task = session.dataTaskWithURL(url, completionHandler: {
      (data, resp, err) in
      print(data)
      print(resp)
      print(err)
    })
    
    task.resume()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

