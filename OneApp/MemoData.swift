//
//  MemoData.swift
//  OneApp
//
//  Created by nonoho.honda on 2020/05/28.
//  Copyright © 2020 nonoho.honda. All rights reserved.
//

import Foundation

class MemoData: NSObject, NSCoding {
    var memoTitle: String?

    override init() { }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(memoTitle, forKey: "todoTitle")
    }

    required init?(coder aDecoder: NSCoder) {
        memoTitle = aDecoder.decodeObject(forKey: "todoTitle") as? String
    }
}
