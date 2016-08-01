//
//  ViewController.swift
//  SerjaoTabajara
//
//  Created by Avenue Code on 7/14/16.
//  Copyright © 2016 jonas. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.updateSiriVocabulary()
        if INPreferences.siriAuthorizationStatus() != .authorized{
            INPreferences.requestSiriAuthorization { (INSiriAuthorizationStatus) in
                if INSiriAuthorizationStatus == .authorized{
                    NSLog("cool")
                }
            }
        }else{
            NSLog("already authorizde")
        }        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateSiriVocabulary(){
        DispatchQueue(label: "SiriVocabulary").async {
            let pharses = OrderedSet(array: ["comer salgadão", "pegar um rango", "comer salgado", "melhor salgado do mundo", "comer salgado", "comer", "lanchar","get food", "get something to eat", "get snacks", "potato chips" , "get cheese bread"])
            INVocabulary.shared().setVocabularyStrings(pharses, of: INVocabularyStringType.workoutActivityName)
            
            let nomes = OrderedSet(array: ["amigão", "amigo"])
            INVocabulary.shared().setVocabularyStrings(nomes, of: .contactName)
        }
    }


}

