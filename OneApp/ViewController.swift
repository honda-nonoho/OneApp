//
//  ViewController.swift
//  OneApp
//
//  Created by nonoho.honda on 2020/05/30.
//  Copyright © 2020 nonoho.honda. All rights reserved.
//

import UIKit

//クラスの継承を追加
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return MemoFile.count
    }
    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let MemoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath)
        //変数の中身を作る
        MemoCell.textLabel!.text = MemoFile[indexPath.row]
        //戻り値の設定（表示する中身)
        return MemoCell
    }


        //最初からあるコード
        override func viewDidLoad() {
            super.viewDidLoad()
            //追加画面で入力した内容を取得する
            if UserDefaults.standard.object(forKey: "MemoList") != nil {
                MemoFile = UserDefaults.standard.object(forKey: "MemoList") as! [String]
            }
        }

        //最初からあるコード
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    }
