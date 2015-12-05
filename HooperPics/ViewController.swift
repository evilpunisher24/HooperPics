//
//  ViewController.swift
//  HooperPics
//
//  Created by YeYiquan on 15/11/30.
//  Copyright (c) 2015年 YeYiquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    var currentPicIndex = 0
    var picsAdresses = [String]()
    var picsDigger = HooperPicsDigger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        picsAdresses = picsDigger.picsAddress
        if picsAdresses.count > 0 {
            if let img = UIImage(data: NSData(contentsOfURL: NSURL(string: picsAdresses[0])!)!){
                imageView.image = img
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func slideToNextPic() {
        if currentPicIndex + 1 < picsAdresses.count {
            let url = NSURL(string: picsAdresses[currentPicIndex + 1])
            if let img = UIImage(data: NSData(contentsOfURL: url!)!){
                self.imageView.image = img
                currentPicIndex++
            }
        }
    }

    func slideToPreviousPic() {
        if currentPicIndex - 1 >= 0 {
            let url = NSURL(string: picsAdresses[currentPicIndex - 1])
            if let img = UIImage(data: NSData(contentsOfURL: url!)!){
                self.imageView.image = img
                currentPicIndex--
            }
        }
    }
    
    @IBAction func swipeRight(sender: UISwipeGestureRecognizer) {
        slideToPreviousPic()
    }
    
    @IBAction func SwipeLeft(sender: UISwipeGestureRecognizer) {
        slideToNextPic()
    }
}

