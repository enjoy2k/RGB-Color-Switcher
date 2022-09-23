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
        
        redIndicator.text = string(from: redSlider)
        greenIndicator.text = string(from: greenSlider)
        blueIndicator.text = string(from: blueSlider)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        colorPreview.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        redIndicator.text = String(format: "%.2f", redSlider.value)
        greenIndicator.text = String(format: "%.2f", greenSlider.value)
        blueIndicator.text = String(format: "%.2f", blueSlider.value)
    } // Вот здесь очень интересно получается) Каждый раз прикасаясь к любому из слайдеров, в соответствующий лэйбл передаётся значение. А два остальных слайдера значений не меняют, НО ОБНОВЛЯЮТ ИХ! Так как код воспроизводится каждый раз при касании слайдера! И это говорит мне о том что код не оптимальный, и его нужно оптимизировать
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
}
