//
//  ViewController.swift
//  StoryboardPlayground
//
//  Created by Kyle Schang on 10/27/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        discountPickerView.dataSource = self
        discountPickerView.delegate = self
        
    }

    
    // Creating a PickerView
    @IBOutlet weak var discountPickerView: UIPickerView!

}


// Extension to configure the PickerView in the code
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Sets number of Components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Sets number of items in each component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
        
    }
    
    // Setting the title for each item in the PickerView
    // Usually make an array of strings an then set the titles from there
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Test"
    }
    
    // Sets what you want to happen after you change the selected Row in the PickerView
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print ("Test (\(row))")
    }
    
}
