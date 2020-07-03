//
//  TitleViewController.swift
//  OneApp
//
//  Created by nonoho.honda on 2020/06/22.
//  Copyright © 2020 nonoho.honda. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    //たて
    @IBOutlet weak var titleLabelTopConstraint: NSLayoutConstraint!
    //横
    @IBOutlet weak var titleLabelRightConstraint: NSLayoutConstraint!
    
    
    override func loadView() {
        super.loadView()
        
        titleLabelTopConstraint.constant -= 250
        titleLabel.alpha = 0
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    
    }
private func showAnimation() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.9, options: [], animations: {
                self.titleLabelTopConstraint.constant += 250
                self.titleLabel.alpha = 1
                self.view.layoutIfNeeded()
            }) { (_) in
                self.dismissAnimation()
            }
            
        }
            
        
        }
    
    private func dismissAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
              UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.9, options: [], animations: {
                    self.titleLabelRightConstraint.constant -= 200
                    self.titleLabel.alpha = 0
                    self.view.layoutIfNeeded()
                    
                
                })
                
            }
            
            
        }
    }
    


    


