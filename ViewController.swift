//
//  ViewController.swift
//  StackViewWithButtons
//
//  Created by Ramala Srinivasulu, Leela on 9/26/18.
//  Copyright © 2018 Leela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonsHolder: UIStackView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var hideOrShowButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Hide second button so that first button should be center aligned with proportional width.
    @IBAction func hideSecondButton(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) {
            if self.secondButton.isHidden {
                
                // Unhide Second button
                self.secondButton.isHidden = false
                self.buttonsHolder.modify(forAxis: .horizontal,         alignment: .fill, distribution: .fillEqually)
                self.hideOrShowButton.setTitle("Hide", for: .normal)
            } else {
                
                // Hide Second button and show in center of the view
                self.secondButton.isHidden = true
                self.buttonsHolder.modify(forAxis: .vertical, alignment: .center, distribution: .fillProportionally)
                self.hideOrShowButton.setTitle("Show", for: .normal)
            }
        }
    }

}

extension UIStackView {
    func modify(forAxis axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution: Distribution) {
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
    }
}

@IBDesignable extension UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }
        get {
            return self.layer.cornerRadius
        }
    }
}
