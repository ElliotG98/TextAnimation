//
//  ViewController.swift
//  TextAnimation
//
//  Created by Elliot Glaze on 20/03/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    let label:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 38, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let alphabetString:String = "abcdefghijklmnopqrstuvwxyz"
    var startText: [String] = [" "]
    let endText = "hello"
    var index = 0
    var startValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabel()
        
        
        
        
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: .default)
        displayLink.preferredFramesPerSecond = 12
        
    }
    
    @objc func handleUpdate(displayLink: CADisplayLink) {
        let alphabetCharArray = Array(alphabetString)
        let endTextCharArray = Array(endText)
        
        
        label.text = startText.joined(separator: " ")
        print(startText)
        
        if startValue >= endText.count {
            displayLink.invalidate()
        }else{
            if alphabetCharArray[index] == endTextCharArray[startValue] {
                startText[startValue] = "\(alphabetCharArray[index])"
                index = 0
                startValue += 1
                if startValue != endText.count{
                    startText += [" "]
                }
            }else{
                startText[startValue] = "\(alphabetCharArray[index])"
                index += 1
            }
        }
    }
    
    
    
    func setupLabel() {
        view.addSubview(label)
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", metrics: nil, views: ["v0": label]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", metrics: nil, views: ["v0": label]))
    }


}

