//
//  ViewController.swift
//  KolodaTest
//
//  Created by Javier Loucim on 10/15/16.
//  Copyright © 2016 Javier Loucim. All rights reserved.
//

import UIKit
import Koloda
import pop

class ViewController: UIViewController {

    var cards:Array<String> = ["message 1", "message 2"]

    

    @IBOutlet weak var cardsView: KolodaView!
    
    fileprivate let frameAnimationSpringBounciness: CGFloat = 9
    fileprivate let frameAnimationSpringSpeed: CGFloat = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardsView.delegate = self
        cardsView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: KolodaViewDelegate {

    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        cardsView.resetCurrentCardIndex()
    }
    func kolodaShouldApplyAppearAnimation(koloda: KolodaView) -> Bool {
        return true
    }
    
    func kolodaShouldMoveBackgroundCard(koloda: KolodaView) -> Bool {
        return false
    }
    
    func kolodaShouldTransparentizeNextCard(koloda: KolodaView) -> Bool {
        return true
    }
    
    func koloda(kolodaBackgroundCardAnimation koloda: KolodaView) -> POPPropertyAnimation? {
        let animation = POPSpringAnimation(propertyNamed: kPOPViewFrame)
        animation?.springBounciness = self.frameAnimationSpringBounciness
        animation?.springSpeed = self.frameAnimationSpringSpeed
        return animation
    }
    
}


extension ViewController: KolodaViewDataSource {
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let view = FrontView.initFromNib()
        view.backgroundColor = (index == 0 ? UIColor.darkGray : UIColor.gray)
        view.configureWithMessage(message: cards[Int(index)])
        return view
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        let laterView = LaterView.initFromNib()
        return laterView
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return cards.count
    }
}
