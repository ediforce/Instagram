//
//  CommentData.swift
//  Instagram
//
//  Created by Keiichi Funatsuki on 2018/05/21.
//  Copyright © 2018年 keiichi.funatsuki. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class CommentData: NSObject {
    var id: String?
    var text: String?
    var name: String?
    var date: NSDate?
    
    init(snapshot: DataSnapshot, myId: String) {
        
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        self.text = valueDictionary["text"] as? String
        self.name = valueDictionary["name"] as? String
        
        let time = valueDictionary["time"] as? String
        self.date = NSDate(timeIntervalSinceReferenceDate: TimeInterval(time!)!)

    }
    
}
