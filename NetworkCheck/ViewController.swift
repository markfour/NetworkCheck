//
//  ViewController.swift
//  NetworkCheck
//
//  Created by HayashidaKazumi on 2016/01/23.
//  Copyright © 2016年 HayashidaKazumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var resultTextView: UITextView!
  
  var output = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    view.endEditing(true)
  }
  
  func testURLSession() {
    // TODO use ATS
    guard let url = NSURL(string: "http://127.0.0.1:80") else { return }
    let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    let task = session.dataTaskWithURL(url, completionHandler: {
      (data, resp, err) in
      
      guard let data = data else { return }
      guard let out = NSString(data:data, encoding:NSUTF8StringEncoding) else { return }
      guard let description = resp?.description else { return }
      
      self.output = out as String
      self.output += "\n"
      self.output += description
      
      dispatch_async(dispatch_get_main_queue(), { () -> Void in
        self.resultTextView.text = self.output
      })
    })
    
    task.resume()
  }
  
  @IBAction func onTcpTap(sender: AnyObject) {
    testURLSession()
  }
}

