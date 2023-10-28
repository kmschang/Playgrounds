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

    public let titlePercentages:[String] = ["0%","5%","10%","15%","20%","25%","30%","35%","40%","45%","50%","55%","60%","65%","70%","75%","80%","85%","90%","95%","100%"]
    public let discountPercentages:[Double] = [0.00,0.05,0.10,0.15,0.20,0.25,0.30,0.35,0.40,0.45,0.50,0.55,0.60,0.65,0.70,0.75,0.80,0.85,0.90,0.95,1.00]
    public let multiplierPercentages:[Double] = [1.00,0.95,0.90,0.85,0.80,0.75,0.70,0.65,0.60,0.55,0.50,0.45,0.40,0.35,0.30,0.25,0.20,0.15,0.10,0.05,0.00]
    
    public var totalDiscountPercentageMultiplier:Double = 0.00
    
    
    
    // Creating a PickerView
    @IBOutlet weak var discountPickerView: UIPickerView!
    
    
    // Labels
    @IBOutlet weak var multiplierPercentageLabel: UILabel!
    @IBOutlet weak var discountPercentageLabel: UILabel!
    @IBOutlet weak var hundredTotalLabel: UILabel!
    
    
    // Discount Buttons
    @IBAction func addDiscountAction(_ sender: Any) {
        if numDiscounts < 4 {
            numDiscounts += 1
        }
        discountPickerView.reloadAllComponents()
        print(numDiscounts)
    }
    @IBAction func deleteDiscountAction(_ sender: Any) {
        if numDiscounts > 1 {
            numDiscounts -= 1
        }
        discountPickerView.reloadAllComponents()
        print(numDiscounts)
    }
    
    
    public var numDiscounts:Int = 1
    public var multiplierPercentage:Double = 0.0
    public var discountPercentage:Double = 0.0
    
    public var discountOne:Double = 0.0
    public var discountTwo:Double = 0.0
    public var discountThree:Double = 0.0
    public var discountFour:Double = 0.0

    
    func calculations() {
        if numDiscounts == 1 {
            multiplierPercentage = discountOne
            discountPercentage = (1 - multiplierPercentage)
        } else if numDiscounts == 2 {
            multiplierPercentage = discountOne * discountTwo
            discountPercentage = (1 - multiplierPercentage)
        } else if numDiscounts == 3 {
            multiplierPercentage = discountOne * discountTwo * discountThree
            discountPercentage = (1 - multiplierPercentage)
        } else if numDiscounts == 4 {
            multiplierPercentage = discountOne * discountTwo * discountThree * discountFour
            discountPercentage = (1 - multiplierPercentage)
        }
    }
    
    func updateLabels() {
        multiplierPercentageLabel.text = String(format: "Multtiplier Percentage: $%.4f", multiplierPercentage)
        discountPercentageLabel.text = String(format: "Discount Percentage: $%.4f", discountPercentage)
        hundredTotalLabel.text = String(format: "$100 Total: $%.4f", (100 * multiplierPercentage))
    }
    
    
}


// Extension to configure the PickerView in the code
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Sets number of Components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numDiscounts
    }
    
    // Sets number of items in each component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return titlePercentages.count
    }
    
    // Setting the title for each item in the PickerView
    // Usually make an array of strings an then set the titles from there
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titlePercentages[row]
    }
    
    // Sets what you want to happen after you change the selected Row in the PickerView
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch numDiscounts {
        case 1:
            discountOne = multiplierPercentages[row]
        case 2:
            discountTwo = multiplierPercentages[row]
        case 3:
            discountThree = multiplierPercentages[row]
        case 4:
            discountFour = multiplierPercentages[row]
        default:
            print()
        }

        calculations()
        updateLabels()

    }
    
}
