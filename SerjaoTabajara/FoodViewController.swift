//
//  FoodViewController.swift
//  SerjaoTabajara
//
//  Created by Avenue Code on 7/17/16.
//  Copyright © 2016 jonas. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {

    @IBOutlet weak var foodTitle : UILabel!
    @IBOutlet weak var foodImage : UIImageView!
    var messageContent: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if messageContent != nil{
            let results = DataManager().searchSalgados(messageContent!)
            if(results.count > 0){
                foodTitle.text = results[0].nome + " - " + results[0].descricao
                foodImage.image = results[0].imagem
                foodImage.setNeedsLayout()
                foodImage.setNeedsDisplay()
                foodImage.layoutIfNeeded()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
