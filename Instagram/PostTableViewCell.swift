//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Keiichi Funatsuki on 2018/05/07.
//  Copyright © 2018年 keiichi.funatsuki. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PostTableViewCell: UITableViewCell {
    
    var postData:PostData!
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentLabel: UILabel!
    
    var postArray: [PostData] = []


//    @IBAction func addComment(_ sender: Any) {
//        let name = Auth.auth().currentUser?.displayName
//
//        if let commentText = commentLabel.text {
//            postData.comments.append("\(name!): \(commentText)")
//        }
//    }
    
//    var comments: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setPostData(_ postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"

        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
        
        var text = ""
        for i in 0 ..< postData.comments.count {
            text = text + postData.comments[i]["name"]! + " ： " + postData.comments[i]["text"]!
            text.append("\n")
        }
        self.commentLabel.text = text
    }
}
