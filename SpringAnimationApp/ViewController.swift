//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by SWIFT on 14.04.2025.
//
import SpringAnimation
import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var animationLabel: UILabel!
    @IBOutlet weak var animationButton: SpringButton!
    
   private var randomAnimation = Animation.getRandomAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationButton.setTitle("Run", for: .normal)
        setAnimationLabel()
        
    }
    
    @IBAction func animationButtonPressed() {
        
        setAnimationForView()
        setAnimationLabel()
        
        randomAnimation = Animation.getRandomAnimation()
        animationButton.setTitle(randomAnimation.presetName, for: .normal)
    }
    
  private  func setAnimationLabel() {
        
        animationLabel.text = """
           Preset:  \(randomAnimation.presetName)
           Curve: \(randomAnimation.curve))
           Force: \(String(format: "%.2f",randomAnimation.force))
           Duration: \(String(format: "%.2f",randomAnimation.duration))
           Delay: \(String(format: "%.2f",randomAnimation.delay))
        """
    }
    
   private func setAnimationForView () {
        animationView.animation = randomAnimation.presetName
        animationView.curve =  randomAnimation.curve
        animationView.force = randomAnimation.force
        animationView.duration = randomAnimation.duration
        animationView.delay = randomAnimation.delay
        animationView.animateNext {
            UIView.animate(withDuration: 0.3)  { [unowned self] in
            animationView.transform = .identity
            }
        }
        animationView.animate()
    }
}

