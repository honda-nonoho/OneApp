//
//  AddMemoViewController.swift
//  OneApp
//
//  Created by nonoho.honda on 2020/05/31.
//  Copyright © 2020 nonoho.honda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore


class AddMemoViewController: UIViewController {

        @IBOutlet weak var memoTextView: UITextView!
        @IBOutlet weak var FirstLabel: UILabel!
        @IBOutlet weak var SecondLabel: UILabel!
        @IBOutlet weak var ThirdLabel: UILabel!
        @IBOutlet weak var saveButton: UIButton!
    

    var docRef: DocumentReference!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            memoTextView.layer.cornerRadius = 10
            memoTextView.layer.masksToBounds = true
            memoTextView.layer.borderColor = UIColor.white.cgColor
            memoTextView.layer.borderWidth = 3.0
            
            saveButton.layer.cornerRadius = 10
            saveButton.layer.masksToBounds = true
            saveButton.layer.borderColor = UIColor.white.cgColor
            saveButton.layer.borderWidth = 3.0
            
            
    
            docRef = Firestore.firestore().document("sampleData/inspiration")
        }
    

        @IBAction func save(_ sender: Any) {
            guard let memoText = memoTextView.text, !memoText.isEmpty else { return }
            let dataToSave: [String: Any] = ["memo": memoText]
            docRef.setData(dataToSave) { (error) in
              if let error = error {
               print("エラーです: \(error.localizedDescription)")
             } else {
               print("保存できました")
             }
         }
            let inputText = memoTextView.text
            let ud = UserDefaults.standard
            if ud.array(forKey: "memoArray") != nil{
                //saveMemoArrayに取得
                var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
                    //テキストに何か書かれているか？
                if inputText != ""{
                    //配列に追加
                    saveMemoArray.append(inputText!)
                    ud.set(saveMemoArray, forKey: "memoArray")
                }else{
                    showAlert(title: "何も入力されていません")

                }

            }else{
                //最初、何も書かれていない場合
                var newMemoArray = [String]()
                //nilを強制アンラップはエラーが出るから
                if inputText != ""{
                    //inputtextはoptional型だから強制アンラップ
                    newMemoArray.append(inputText!)
                    ud.set(newMemoArray, forKey: "memoArray")
                }else{
                    showAlert(title: "何も入力されていません")
                }
            }
            showAlert(title: "保存完了")
            ud.synchronize()
        }

        func showAlert(title:String){
            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))

            self.present(alert, animated: true, completion:nil)
        }
    }

