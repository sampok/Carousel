//
//  TermsViewController.swift
//  Carousel
//
//  Created by Sampo Karjalainen on 5/30/16.
//  Copyright © 2016 Sampo Karjalainen. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    @IBOutlet weak var termsWebView: UIWebView!
    
    let url = "https://www.dropbox.com/terms?mobile=1"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Convert the url String to a NSURL object.
        let requestURL = NSURL(string:url)
        // Place the URL in a URL Request.
        let request = NSURLRequest(URL: requestURL!)
        // Load Request into WebView.
        termsWebView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
