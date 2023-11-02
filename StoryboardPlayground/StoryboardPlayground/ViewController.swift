//
//  ViewController.swift
//  StoryboardPlayground
//
//  Created by Kyle Schang on 10/27/23.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        label.text = String(discount)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        label.text = String(discount)
    }
    
    var discount:Double = 0.0
    
    @IBAction func discountButton(_ sender: Any) {
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "second_vc") as! SecondViewController
        present(vc, animated: true)
                
        
        
    }
    
    
    
    
    
    
    
}
