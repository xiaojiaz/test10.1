//
//  ViewController.swift
//  dy
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 123. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var animator = UIDynamicAnimator(referenceView: self.myView)
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
    }

    @IBOutlet var myView: UIView!
    @IBAction func add(_ sender: Any) {
        let width = Int(myView.bounds.width / 20)
        let randx = Int(arc4random() % 20) * width
        let label = UILabel(frame: CGRect(x: randx, y: 20, width: width, height: width))
        label.backgroundColor = UIColor.red
        label.text = "骚"
        label.textAlignment = .center
        myView.addSubview(label)
        gravity.addItem(label)
        collision.addItem(label)
        collision.translatesReferenceBoundsIntoBoundary = true
    }
    
    @IBAction func up(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    @IBAction func down(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
    }
    
    @IBAction func left(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    
    @IBAction func right(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 1, dy: 0)
    }
    
    @IBAction func all(_ sender: Any) {
        for item in myView.subviews{
            if item is UILabel{
                item.removeFromSuperview()
                gravity.removeItem(item)
                collision.removeItem(item)
            }
        }
    }
}

