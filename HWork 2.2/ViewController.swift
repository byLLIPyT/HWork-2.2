//
//  ViewController.swift
//  HWork 2.2
//
//  Created by Александр Уткин on 25/07/2019.
//  Copyright © 2019 Александр Уткин. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
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
        
        textRed.text = labelRed.text
        textGreen.text = labelGreen.text
        textBlue.text = labelBlue.text
        
        changeColorRGB(red: CGFloat(slideRed.value), green: CGFloat(slideGreen.value), blue: CGFloat(slideBlue.value))
        
        textRed.delegate = self
        textBlue.delegate = self
        textGreen.delegate = self
        
        let toolBar = UIToolbar()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        toolBar.setItems([flexibleSpace,doneButton], animated: false)
        toolBar.sizeToFit()
        
        textRed.inputAccessoryView = toolBar
        textGreen.inputAccessoryView = toolBar
        textBlue.inputAccessoryView = toolBar
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @objc private func doneClicked() {
        
        view.endEditing(true)
        
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
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        checkInputText(mTextField: textRed,   mSlider: slideRed)
        checkInputText(mTextField: textGreen, mSlider: slideGreen)
        checkInputText(mTextField: textBlue , mSlider: slideBlue)
        changeColorRGB(red: CGFloat(slideRed.value),
                       green: CGFloat(slideGreen.value),
                       blue: CGFloat(slideBlue.value))
        labelRed.text = textRed.text
        labelGreen.text = textGreen.text
        labelBlue.text = textBlue.text
        
        return true
    }
    
    private func checkInputText(mTextField: UITextField, mSlider: UISlider) {
        guard let inputText = mTextField.text, !inputText.isEmpty else {
            mTextField.text = "0"
            mSlider.value = 0
            return }
        if let value = Float(inputText) {
            if value > 1 {//
                mTextField.text = "1"
                mSlider.value = value
            } else { mSlider.value = value }
        } else {
            mTextField.text = "0"
            mSlider.value = 0
        }
    }
    
}

