//
//  ViewController.swift
//  Project15
//
//  Created by Charles Martin Reed on 8/22/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tap: UIButton!
    
    //we'll cycle through animations using our currentAnimation as a counter and moving between imageViews
    var imageView: UIImageView!
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //building our initial imageView, for an iPad sized screen, and adding it to the view
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
        
    }

    @IBAction func tapped(_ sender: Any) {
        
        //hide the tap button after first tap; will be unhidden in the completion closure of our animate()
        tap.isHidden = true
        
        //as part of our animations closure, we switch over the currentAnimation variable
        //UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            //uses the iOS default Ease In-Ease Out animation style
            [unowned self] in
            switch self.currentAnimation {
            case 0:
                //scale the view to 2x its default size
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            case 1:
                //essentially, this clears our view of any predefined transform which resets the previous changes applied via the transform property
                self.imageView.transform = CGAffineTransform.identity
            case 2:
                //reposition the view by using deltas - in this case take the delta from the current position to get the new position and place it there
                self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
            case 3:
                self.imageView.transform = CGAffineTransform.identity
            case 4:
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            case 5:
                self.imageView.transform = CGAffineTransform.identity
            case 6:
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = UIColor.green
            case 7:
                self.imageView.alpha = 1
                self.imageView.backgroundColor = UIColor.clear
            default:
                break
            }
        }) { [unowned self] (finished: Bool) in
            self.tap.isHidden = false
        }
        
        //increment our currentAnimation
        currentAnimation += 1
        
        //cap currentAnimation at 7, for a total of 8 possible animations
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
}

