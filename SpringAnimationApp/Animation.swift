//
//  Animation.swift
//  SpringAnimationApp
//
//  Created by SWIFT on 14.04.2025.
//
import SpringAnimation
import Foundation


struct Animation {
    
    let presetName: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: CGFloat
    
    static func getRandomAnimation() -> Animation {
        Animation(presetName: AnimationPreset.allCases.randomElement()?.rawValue ?? "pop" ,
                  curve: AnimationCurve.allCases.randomElement()?.rawValue ?? "easeIn",
                  force: .random(in: 0...1),
                  duration: .random(in: 0.5...1),
                  delay: .random(in: 0..<0.5)
        )
    }
}
