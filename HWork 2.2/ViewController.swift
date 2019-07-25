//
//  ViewController.swift
//  HWork 2.2
//
//  Created by Александр Уткин on 25/07/2019.
//  Copyright © 2019 Александр Уткин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    @IBOutlet var labelRed: UILabel!
    @IBOutlet var labelGreen: UILabel!
    @IBOutlet var labelBlue: UILabel!
    
    @IBOutlet var textRed: UITextField!
    @IBOutlet var textGreen: UITextField!
    @IBOutlet var textBlue: UITextField!
    
    
    @IBOutlet var slideRed: UISlider!
    @IBOutlet var slideGreen: UISlider!
    @IBOutlet var slideBlue: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 20
        labelRed.text = String(slideRed.value)
        labelGreen.text = String(slideGreen.value)
        labelBlue.text = String(slideBlue.value)
        changeColorRGB(red: CGFloat(slideRed.value), green: CGFloat(slideGreen.value), blue: CGFloat(slideBlue.value))
    }
    
    
    @IBAction func redSlide() {
        labelRed.text = String(format: "%.2f", slideRed.value)
        textRed.text = String(format: "%.2f", slideRed.value)
        changeColorRGB(red: CGFloat(slideRed.value), green: CGFloat(slideGreen.value), blue: CGFloat(slideBlue.value))
    }
    
    
    @IBAction func greenSlide() {
        labelGreen.text = String(format: "%.2f", slideGreen.value)
        textGreen.text = String(format: "%.2f", slideGreen.value)
        changeColorRGB(red: CGFloat(slideRed.value), green: CGFloat(slideGreen.value), blue: CGFloat(slideBlue.value))
    }
    
    
    @IBAction func blueSlide() {
        labelBlue.text = String(format: "%.2f", slideBlue.value)
        textBlue.text = String(format: "%.2f", slideBlue.value)
        changeColorRGB(red: CGFloat(slideRed.value), green: CGFloat(slideGreen.value), blue: CGFloat(slideBlue.value))
    }
    
    func changeColorRGB(red: CGFloat, green: CGFloat, blue: CGFloat) {
        mainView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}

