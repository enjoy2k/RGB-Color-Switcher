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
        
        colorPreview.layer.cornerRadius = 15
        
        setColor()
        
        setValue(for: redIndicator, greenIndicator, blueIndicator) // Здесь так же не обязательно вызывать функцию трижды. Достаточно указать несколько параметров через запятую
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
       setColor()
        
        switch sender {
        case redSlider:
            redIndicator.text = string(from: redSlider)
        case greenSlider:
            greenIndicator.text = string(from: greenSlider)
        default:
            blueIndicator.text = string(from: blueSlider)
        } // Здесь я сделал свич чтобы была возможность менять значение только одного слайдера. В этом случае, когда пользователь меняет значение одного из слайдеров, остальные свои значения не обновляют!
    }
    
    private func setColor() {
        colorPreview.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        ) // Обязательно: Метод должен быть обязательно приватным! Располагаться он должен после аутлетов и IBAction'ов!
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redIndicator:
                redIndicator.text = string(from: redSlider)
            case greenIndicator:
                greenIndicator.text = string(from: greenSlider)
            default:
                blueIndicator.text = string(from: blueSlider)
            }
        }
    } // В скобках, после указания типа данных, троеточие обозначает вариативный параметр. При использовании вариативного параметра, все значения, которые передаются в параметр, помещаются в массив!
}
