//
//  TableViewController.swift
//  OneApp
//
//  Created by nonoho.honda on 2020/05/28.
//  Copyright © 2020 nonoho.honda. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var memoList = [MemoData] ()
    override func viewDidLoad() {
        super.viewDidLoad()

     if let storedData = UserDefaults().data(forKey: "memoList") {
            do {
                let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(storedData)
                memoList.append(contentsOf: unarchivedData as! [MemoData])
            } catch {
                print(error)
            }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memoList.count
    }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            
        if indexPath.row == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        return cell
          }else {
        if indexPath.row == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath)
        return cell
          }else {
        if indexPath.row == 2 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdTableViewCell", for: indexPath)
        return cell
          }else {
    }
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
         let memoData = memoList[indexPath.row]

         cell.textLabel?.text = memoData.memoTitle
        return cell
    }
    
            func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        // Delete the row from the data source
        memoList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        let userDefalults = UserDefaults.standard
        do {
        let data: Data = try NSKeyedArchiver.archivedData(withRootObject: self.memoList, requiringSecureCoding: false)
        userDefalults.set(data, forKey: "memoList")
        userDefalults.synchronize()
        } catch {
        print(error)
        }
    }
}
        
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    return UITableViewCell()
   }
}
