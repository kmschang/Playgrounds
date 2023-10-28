//
//  ViewController.swift
//  StoryboardPlayground
//
//  Created by Kyle Schang on 10/27/23.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        discountPickerView.dataSource = self
        discountPickerView.delegate = self
        
        loadDefaults()
        calculations()
        updatePickerViews()
        updateLabels()
        discountPickerView.reloadAllComponents()

        
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
        updateDefaults()
        print(numDiscounts)
    }
    @IBAction func deleteDiscountAction(_ sender: Any) {
        if numDiscounts > 1 {
            numDiscounts -= 1
        }
        discountPickerView.reloadAllComponents()
        updateDefaults()
        print(numDiscounts)
    }
    
    @IBAction func clearCacheAction(_ sender: Any) {
        clearCache()
        calculations()
        updateLabels()
        updatePickerViews()
    }
    
    
    
    
    public var numDiscounts:Int = 1
    public var multiplierPercentage:Double = 0.0
    public var discountPercentage:Double = 0.0
    
    public var discountOne:Double = 0.0
    public var discountTwo:Double = 0.0
    public var discountThree:Double = 0.0
    public var discountFour:Double = 0.0
    
    public var componentOneIndex:Int = 0
    public var componentTwoIndex:Int = 0
    public var componentThreeIndex:Int = 0
    public var componentFourIndex:Int = 0

    
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
        updateDefaults()
    }
    
    func updateLabels() {
        multiplierPercentageLabel.text = String(format: "Multtiplier Percentage: $%.4f", multiplierPercentage)
        discountPercentageLabel.text = String(format: "Discount Percentage: $%.4f", discountPercentage)
        hundredTotalLabel.text = String(format: "$100 Total: $%.4f", (100 * multiplierPercentage))
        updateDefaults()
    }
    
    func updatePickerViews() {
        switch numDiscounts {
        case 0:
            numDiscounts = 1
            updateLabels()
        case 1:
            discountPickerView.selectRow(componentOneIndex, inComponent: 0, animated: true)
        case 2:
            discountPickerView.selectRow(componentOneIndex, inComponent: 0, animated: true)
            discountPickerView.selectRow(componentTwoIndex, inComponent: 1, animated: true)
        case 3:
            discountPickerView.selectRow(componentOneIndex, inComponent: 0, animated: true)
            discountPickerView.selectRow(componentTwoIndex, inComponent: 1, animated: true)
            discountPickerView.selectRow(componentThreeIndex, inComponent: 2, animated: true)
        case 4:
            discountPickerView.selectRow(componentOneIndex, inComponent: 0, animated: true)
            discountPickerView.selectRow(componentTwoIndex, inComponent: 1, animated: true)
            discountPickerView.selectRow(componentThreeIndex, inComponent: 2, animated: true)
            discountPickerView.selectRow(componentFourIndex, inComponent: 3, animated: true)
        default:
            print("We have a problem")
        }
        discountPickerView.reloadAllComponents()
    }
    
    func updateDefaults() {
        defaults.set(numDiscounts, forKey: "numDiscounts")
        defaults.set(multiplierPercentage, forKey: "multiplierPercentage")
        defaults.set(discountPercentage, forKey: "discountPercentage")
        
        defaults.set(discountOne, forKey: "discountOne")
        defaults.set(discountTwo, forKey: "discountTwo")
        defaults.set(discountThree, forKey: "discountThree")
        defaults.set(discountFour, forKey: "discountFour")
        
        defaults.set(componentOneIndex, forKey: "componentOneIndex")
        defaults.set(componentTwoIndex, forKey: "componentTwoIndex")
        defaults.set(componentThreeIndex, forKey: "componentThreeIndex")
        defaults.set(componentFourIndex, forKey: "componentFourIndex")
    }
    
    func loadDefaults() {
        numDiscounts = defaults.integer(forKey: "numDiscounts")
        multiplierPercentage = defaults.double(forKey: "multiplierPercentage")
        discountPercentage = defaults.double(forKey: "discountPercentage")
        
        discountOne = defaults.double(forKey: "discountOne")
        discountTwo = defaults.double(forKey: "discountTwo")
        discountThree = defaults.double(forKey: "discountThree")
        discountFour = defaults.double(forKey: "discountFour")
        
        componentOneIndex = defaults.integer(forKey: "componentOneIndex")
        componentTwoIndex = defaults.integer(forKey: "componentTwoIndex")
        componentThreeIndex = defaults.integer(forKey: "componentThreeIndex")
        componentFourIndex = defaults.integer(forKey: "componentFourIndex")
    }
    
    func clearCache() {
        numDiscounts = 1
        discountPickerView.selectRow(0, inComponent: 0, animated: true)
        discountPickerView.reloadAllComponents()
        defaults.removeObject(forKey: "multiplierPercentage")
        defaults.removeObject(forKey: "discountPercentage")
        defaults.removeObject(forKey: "discountOne")
        defaults.removeObject(forKey: "discountTwo")
        defaults.removeObject(forKey: "discountThree")
        defaults.removeObject(forKey: "discountFour")
        defaults.removeObject(forKey: "componentOneIndex")
        defaults.removeObject(forKey: "componentTwoIndex")
        defaults.removeObject(forKey: "componentThreeIndex")
        defaults.removeObject(forKey: "componentFourIndex")
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
            componentOneIndex = row
        case 2:
            discountTwo = multiplierPercentages[row]
            componentTwoIndex = row
        case 3:
            discountThree = multiplierPercentages[row]
            componentThreeIndex = row
        case 4:
            discountFour = multiplierPercentages[row]
            componentFourIndex = row
        default:
            print()
        }

        calculations()
        updateLabels()

    }
    
}
