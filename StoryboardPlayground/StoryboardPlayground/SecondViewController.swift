//
//  SecondViewController.swift
//  StoryboardPlayground
//
//  Created by Kyle Schang on 11/2/23.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        view.backgroundColor = .systemRed
    
        

    }
    
    @IBAction func backButton(_ sender: Any) {
        
        

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "main_vc") as! ViewController
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
        performSegue(withIdentifier: "main", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.discount = 12.5
    }
    

}
