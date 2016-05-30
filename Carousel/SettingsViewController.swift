//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Sampo Karjalainen on 5/30/16.
//  Copyright © 2016 Sampo Karjalainen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var settingsView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = settingsView.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClose(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onSignout(sender: AnyObject) {
        let signOutSheet = UIAlertController(title: "Are you sure you want to Sign Out?", message: nil, preferredStyle: .ActionSheet)
        let signOutAction = UIAlertAction(title: "Sign Out", style: .Destructive) { (action) in
            self.performSegueWithIdentifier("signoutSegue", sender: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // nothing
        }
        signOutSheet.addAction(signOutAction)
        signOutSheet.addAction(cancelAction)
        presentViewController(signOutSheet, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
        
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
