//
//  ViewController2.swift
//  Week6
//
//  Created by Khoi Hoang on 07/02/2020.
//  Copyright © 2020 Khoi Hoang. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var UpperLabel: UILabel!
    @IBOutlet weak var BottomLabel: UILabel!
    
    @IBAction func PriceButton(_ sender: UIButton) {
        
        BottomLabel.text = "14 pieces, 10 Nigiri & 4 Maki - 89DKK"
        UpperLabel.text = "52 pieces, 8 Nigiri & 44 Maki - 559DKK"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
