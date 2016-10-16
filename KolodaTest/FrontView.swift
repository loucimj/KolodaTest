//
//  FrontView.swift
//  KolodaTest
//
//  Created by Javier Loucim on 10/15/16.
//  Copyright © 2016 Javier Loucim. All rights reserved.
//

import UIKit

class FrontView: UIView , NibLoadable {

    @IBOutlet weak var messageLabel: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var isFlipped = false
    
    func configureWithMessage(message:String) {
        messageLabel.text = message
    }
    @IBAction func sendDataAction(_ sender: AnyObject) {
        animate()
    }

    func animate() {
        let backView = BackView.initFromNib()
        backView.frame = self.frame
        backView.backgroundColor = UIColor.green
        UIView.transition(with: self, duration: 0.5, options:.transitionFlipFromRight, animations: { () -> Void in
            self.addSubview(backView)
            }, completion: { (Bool) -> Void in
                self.isFlipped = true
        })
    }
    
}
