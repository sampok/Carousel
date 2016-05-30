//
//  IntroViewController.swift
//  Carousel
//
//  Created by Sampo Karjalainen on 5/26/16.
//  Copyright © 2016 Sampo Karjalainen. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet var tileImageViews: Array<UIView>?
    
    // Original ones
    // var xOffsets : [CGFloat] = [-30, 75, -66, 10, -200, -15]
    // var yOffsets : [CGFloat] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [CGFloat] = [-90, 45, 10, 70, -120, -80]
    var yOffsets : [CGFloat] = [-285, -240, -415, -408, -480, -500]
    var scales : [CGFloat] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [CGFloat] = [-10, -10, 10, 10, 10, -10]
    
    let minScroll = CGFloat(-20)
    let maxScroll = CGFloat(568)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        introScrollView.contentSize = introImageView.image!.size
        introScrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // introScrollView offset goes from -20 to 568
        let offset = CGFloat(introScrollView.contentOffset.y)
        
        for (index, tileImageView) in tileImageViews!.enumerate() {
            let tx = convertValue(offset, r1Min: minScroll, r1Max: maxScroll, r2Min: xOffsets[index], r2Max: 0)
            let ty = convertValue(offset, r1Min: minScroll, r1Max: maxScroll, r2Min: yOffsets[index], r2Max: 0)
            let rotation = convertValue(offset, r1Min: minScroll, r1Max: maxScroll, r2Min: rotations[index], r2Max: 0)
            let scale = convertValue(offset, r1Min: minScroll, r1Max: maxScroll, r2Min: scales[index], r2Max: 1)
            tileImageView.transform = CGAffineTransformMakeTranslation(tx, ty)
            tileImageView.transform = CGAffineTransformScale(tileImageView.transform, scale, scale)
            tileImageView.transform = CGAffineTransformRotate(tileImageView.transform, CGFloat(Double(rotation) * M_PI / 180))
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
