//
//  PostData.swift
//  Instagram
//
//  Created by Keiichi Funatsuki on 2018/05/07.
//  Copyright © 2018年 keiichi.funatsuki. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PostData: NSObject {
    var id: String?
    var image: UIImage?
    var imageString: String?
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    //空の辞書の配列を作成
    var comments = [[String:String]]()
    //    var comments: [(name:String, text: String)] = []
    
    init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: Any]
        
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: Data(base64Encoded: imageString!, options: .ignoreUnknownCharacters)!)
        
        self.name = valueDictionary["name"] as? String
        
        self.caption = valueDictionary["caption"] as? String
        
        //コメント用に追加
//        if let comments = valueDictionary["comments"] as? [[String:String]] {
//            self.comments = comments
//        }
        
        let time = valueDictionary["time"] as? String
        self.date = Date(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
        
        if let likes = valueDictionary["likes"] as? [String] {
            self.likes = likes
        }
        
        for likeID in self.likes {
            if likeID == myId {
                self.isLiked = true
                break
            }
        }
        
        if let comments = valueDictionary["comments"] as? [[String:String]] {
            self.comments = comments
        }


    }

}
