//
//  ViewController.swift
//  Rollo1000
//
//  Created by Colaborador on 28/10/15.
//  Copyright © 2015 ITCH. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var attempts = 0
    var randNumber: Int = generateNum(1, 999)
    var minimumValue: Int = 1
    var maximumValue: Int = 999

    @IBOutlet weak var attemptsLbl: UILabel!
    
    @IBOutlet weak var display: UILabel!

    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var playBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayMessage()
        picker.dataSource = self
        picker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playBtn(sender: UIButton) {
        let currentValue: Int = Int(display.text!)!
        attempts++
        attemptsLbl.text = "\(attempts) intentos"
        guess(currentValue)
    }
    
    @IBAction func replayBtn(sender: UIButton) {
        resetGame()
    }
    
    let digits = [["0","1","2","3","4","5","6","7","8","9"],["0","1","2","3","4","5","6","7","8","9"],["0","1","2","3","4","5","6","7","8","9"]]
    
    var oculto: Int = 0
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return digits.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return digits[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return digits[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let c = digits[0][pickerView.selectedRowInComponent(0)]
        let d = digits[1][pickerView.selectedRowInComponent(1)]
        let u = digits[2][pickerView.selectedRowInComponent(2)]
        display.text = "\(c)"+"\(d)"+"\(u)"
    }
    
    func displayMessage () {
        display.text = "Adivina un número del \(minimumValue)-\(maximumValue)"
    }
    
    func guess(num: Int) {
        if(attempts < 12) {
            if(num == randNumber) {
                display.text = "Felicidades, ganaste en \(attempts) intentos!"
                display.textColor = UIColor.greenColor()
                playBtn.enabled = false
            }
            else if (num < randNumber) {
                minimumValue = num
                displayMessage()
            }
            else {
                maximumValue = num
                displayMessage()
            }
        }
        else {
            display.text = "Lástima, el número era \(randNumber)"
            display.textColor = UIColor.redColor()
            playBtn.enabled = false
        }
    }
    
    func resetGame() {
        randNumber = generateNum(1,999)
        attempts = 0
        attemptsLbl.text = "\(attempts) intentos"
        minimumValue = 1
        maximumValue = 999
        playBtn.enabled = true
        display.textColor = UIColor.whiteColor()
        displayMessage()
    }
    
}


