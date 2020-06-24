//
//  DetailViewController.swift
//  OneApp
//
//  Created by nonoho.honda on 2020/05/31.
//  Copyright © 2020 nonoho.honda. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var memoTextView: UITextView!

    var selectedRow:Int!
    var selectedMemo : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTextView.text = selectedMemo
        memoTextView.layer.cornerRadius = 10
        memoTextView.layer.masksToBounds = true
        memoTextView.layer.borderColor = UIColor.white.cgColor
        memoTextView.layer.borderWidth = 3.0
    }

    @IBAction func deleteMemo(_ sender: Any) {
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            var saveMemoArray = ud.array(forKey: "memoArray") as![String]
            saveMemoArray.remove(at: selectedRow)
            ud.set(saveMemoArray, forKey: "memoArray" )
            ud.synchronize()
            //画面遷移

            self.navigationController?.popViewController(animated: true)
        }
    }
}
