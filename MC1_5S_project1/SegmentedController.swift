//
//  SegmentedController.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/06.
//

import UIKit

class SegViewController : UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func switchViews (_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            firstView.alpha = 1
            secondView.alpha = 0
        } else {
            firstView.alpha = 0
            secondView.alpha = 1
        }
    }
    
    
    
    
}
