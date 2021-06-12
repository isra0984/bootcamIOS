//
//  ViewController.swift
//  UISlider
//
//  Created by Israel Torres Alvarado on 11/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cuadrado: UIView!
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    
    var colorRed: CGFloat = 0
    var colorGreen: CGFloat = 0
    var colorBlue: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider1.tintColor = UIColor.red
        slider1.value = 50
        slider2.tintColor = UIColor.green
        slider2.value = 50
        slider3.tintColor = UIColor.blue
        slider3.value = 50
        
    }
    
    @IBAction func cambiaSlider1(_ sender: UISlider) {
        
        print("Valor del slider 1: ",  slider1.value)
        colorRed = CGFloat(slider1.value/100.0)
        cuadrado.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: 1.0)
        
    }
    
    @IBAction func cambiaSlider2(_ sender: UISlider) {
        
        print("Valor del slider 2: ",  slider2.value)
        colorGreen = CGFloat(slider2.value/100.0)
        cuadrado.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: 1.0)
        
    }
    
    @IBAction func cambiaSlider3(_ sender: UISlider) {
        
        print("Valor del slider 3: ",  slider3.value)
        colorBlue = CGFloat(slider3.value/100.0)
        cuadrado.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: 1.0)
        
    }
    
}

