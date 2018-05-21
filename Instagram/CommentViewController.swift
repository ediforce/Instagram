//
//  CommentViewController.swift
//  Instagram
//
//  Created by Keiichi Funatsuki on 2018/05/21.
//  Copyright © 2018年 keiichi.funatsuki. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    //    @IBOutlet weak var textView: UITextView!
    
    var postData:PostData?

    

    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = ""
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func commentButton(_ sender: Any) {
    
        let name = Auth.auth().currentUser?.displayName
        
        // 増えたコメントをFirebaseに保存する
        let postRef = Database.database().reference().child(Const.PostPath).child((postData!.id!))
        postData!.comments.append(["name": name!, "text": textView.text!])
        
        let comments = ["comments": postData!.comments]
        postRef.updateChildValues(comments)
        
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
