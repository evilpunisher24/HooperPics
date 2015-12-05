//
//  HooperPicsDigger.swift
//  HooperPics
//
//  Created by YeYiquan on 15/12/1.
//  Copyright (c) 2015年 YeYiquan. All rights reserved.
//

import Foundation
import UIKit

class HooperPicsDigger{
    let homePage = "http://tu.hupu.com"
    var picsAddress = [String]()//存储从网页上截取的图片ip地址数据
    
    init() {
        let url = NSURL(string: homePage)!
        let data = NSData(contentsOfURL: url)!
        let htmlDoc = TFHpple(HTMLData: data)
        
        let txtNodes = htmlDoc.searchWithXPathQuery("//a[@class='img-a']")
        for eachTxtNodes in txtNodes{
            if let elements = eachTxtNodes.childrenWithTagName("img"){
                for eachElement in elements {
                    picsAddress.append(eachElement.objectForKey("src")!)
                }
            }
        }
    }
}