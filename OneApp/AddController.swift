//
//  AddController.swift
//  OneApp
//
//  Created by nonoho.honda on 2020/05/30.
//  Copyright © 2020 nonoho.honda. All rights reserved.
//

//  AddController.swift
import UIKit
var MemoFile = [String]()

class AddController: UIViewController {
    
    @IBOutlet weak var FirstTextField: UITextField!
    @IBOutlet weak var SecondTextField: UITextField!
    @IBOutlet weak var ThirdTextField: UITextField!
    
    @IBAction func AddButton(_ sender: Any) {
        
        //変数に入力内容を入れる
         MemoFile.append(FirstTextField.text!)
        // //追加ボタンを押したらフィールドを空にする
         FirstTextField.text = ""
         MemoFile.append(SecondTextField.text!)
         SecondTextField.text = ""
         MemoFile.append(ThirdTextField.text!)
         ThirdTextField.text = ""
        //変数の中身をUDに追加
        UserDefaults.standard.set(MemoFile, forKey: "MemoList" )

    }
    //最初からあるコード
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
