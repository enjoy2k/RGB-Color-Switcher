//
//  ViewController.swift
//  RGB Color Switcher
//
//  Created by Mac.ДаниилКозлов on 20.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorPreview: UIView!
    
    @IBOutlet var redIndicator: UILabel!
    @IBOutlet var greenIndicator: UILabel!
    @IBOutlet var blueIndicator: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Color preview                       Вот эти разделители были не нужны, поскольку кода не много
        colorPreview.layer.cornerRadius = 15
        
//        Red slider
        redSlider.minimumValue = 0         // Вот эти штуки тоже не нужны. Во вью контроллере выставляются
        redSlider.maximumValue = 1
        
        redIndicator.text = String(redSlider.value)
        
//        Green slider
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        
        greenIndicator.text = String(greenSlider.value)
        
//        Blue slider
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        
        blueIndicator.text = String(blueSlider.value)
    }
    func colorChange() {
        colorPreview.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    @IBAction func redSliderAction() {
        redIndicator.text = String(format: "%.2f", redSlider.value)
        colorChange()
    }
    
    @IBAction func greenSliderAction() {
        greenIndicator.text = String(format: "%.2f",greenSlider.value)
        colorChange()
    }
    
    @IBAction func blueSliderAction() {
        blueIndicator.text = String(format: "%.2f",blueSlider.value)
        colorChange()
    }
}
