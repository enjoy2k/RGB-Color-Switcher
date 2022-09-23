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
        
        colorPreview.backgroundColor = UIColor( // В скобках я пишу инициализатор. Перед скобками же, я указываю тип данных. В данном случае я инициализирую цвет - UIColor.
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )   // Здесь прописываю этот код, чтобы он изначально загружал вью с заданным, нейтральным цветом из слайдеров
        
        redIndicator.text = String(format: "%.2f", redSlider.value)
        greenIndicator.text = String(format: "%.2f", greenSlider.value)
        blueIndicator.text = String(format: "%.2f", blueSlider.value)
    }   // Здесь я передаю в лэйблы соответствующие значения слайдеров. Всё. Теперь при загрузке вью, все необходимые элементы интерфейса будут отображены корректно
    
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
}
