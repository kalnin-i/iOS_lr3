//
//  ViewController.swift
//  ios_lr3
//
//  Created by ІПЗ-31/1 on 25.09.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var picker: UIPickerView!
    @IBOutlet weak var nameTextField: UITextField!
    
    class Username {
        var name: String
        var option: String
        
        init(name: String, option: String) {
            self.name = name
            self.option = option
        }
    }
    
    @IBAction func confirmButtomTapped(_ sender: UIButton) {
        let name = nameTextField.text ?? ""
        let option = data[picker.selectedRow(inComponent: 0)]
        
        let username = Username(name: name, option: option)
        
        print("Імʼя користувача: \(username.name)")
        print("Вибрано: \(username.option)")
    }
    
    let data = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
    }
}

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }

}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
}

