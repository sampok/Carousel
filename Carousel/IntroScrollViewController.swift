//
//  IntroScrollViewController.swift
//  Carousel
//
//  Created by Sampo Karjalainen on 5/30/16.
//  Copyright © 2016 Sampo Karjalainen. All rights reserved.
//

import UIKit

class IntroScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introPageControl: UIPageControl!
    @IBOutlet weak var continueImageView: UIImageView!
    @IBOutlet weak var backupSwitch: UISwitch!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        introScrollView.contentSize = CGSize(width: 1280, height: 568)
        introScrollView.delegate = self
        
        continueImageView.alpha = 0
        backupSwitch.alpha = 0
        continueButton.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page : Int = Int(round(introScrollView.contentOffset.x / 320))
        introPageControl.currentPage = page
        if page == 3 {
            introPageControl.hidden = true
            backupSwitch.alpha = 1
            continueButton.hidden = false
            UIView.animateWithDuration(0.3, animations: {
                self.continueImageView.alpha = 1
            })
        } else {
            introPageControl.hidden = false
            backupSwitch.alpha = 0
            continueButton.hidden = true
            UIView.animateWithDuration(0.3, animations: {
                self.continueImageView.alpha = 0
            })
        }
    }
    
    @IBAction func onContinue(sender: AnyObject) {
        performSegueWithIdentifier("continueSegue", sender: nil)
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
