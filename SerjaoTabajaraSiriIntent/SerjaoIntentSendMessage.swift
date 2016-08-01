//
//  SerjaoIntentSendMessage.swift
//  SerjaoTabajara
//
//  Created by Avenue Code on 7/14/16.
//  Copyright © 2016 jonas. All rights reserved.
//

import UIKit
import Intents
import SerjaoTabajara

class SerjaoIntentSendMessage: NSObject, INSendMessageIntentHandling {
    
    func resolveRecipients(forSendMessage intent: INSendMessageIntent, with completion: ([INPersonResolutionResult]) -> Swift.Void){
        
        var resolutionResults = [INPersonResolutionResult]()
        if (intent.recipients?.count) > 0 {
            let resultsFind = DataManager().searchPerson((intent.recipients?[0].displayName)!)
            switch resultsFind.count {
            case 0:
                resolutionResults += [INPersonResolutionResult.needsMoreDetails(for: (intent.recipients?[0])!)]
                completion(resolutionResults)
                break
            case 1:
                let handle = INPersonHandle(value: "handle", type:  INPersonHandleType.unknown)
                let person = INPerson(personHandle: handle ,nameComponents: nil, displayName: resultsFind[0].nome, image: nil, contactIdentifier: resultsFind[0].nickname, customIdentifier: nil )
                resolutionResults += [.success(with: person)]
                completion(resolutionResults)
                break
            case 2..<10:
                let handle = INPersonHandle(value: "Bruno", type:  INPersonHandleType.unknown)
                var persons = [INPerson]()
                for item in resultsFind {
                    let person = INPerson(personHandle: handle ,nameComponents: nil, displayName: item.nome, image: nil, contactIdentifier: item.nickname, customIdentifier: nil )
                    persons.append(person)
                }
                resolutionResults += [INPersonResolutionResult.disambiguation(with: persons)]
                completion(resolutionResults)
                break
            default:
                break
                
            }
            
        }else{
            completion([INPersonResolutionResult.needsValue()])
        }
    }
    
    func resolveContent(forSendMessage intent: INSendMessageIntent, with completion: (INStringResolutionResult) -> Swift.Void){
        if let content = intent.content {
                let resultsFind = DataManager().searchSalgados(content)
                switch resultsFind.count {
                case 0:
                    let response = INStringResolutionResult.needsValue()
                    completion(response)
                    break
                case 1:
                    let response = INStringResolutionResult.success(with: "Pedir \(resultsFind[0].nome)")
                    completion(response)
                    break
                case 2..<10:
                    var optionsArray = [String]()
                    for item in resultsFind {
                        optionsArray.append(item.nome)
                    }
                    let response = INStringResolutionResult.disambiguation(with: optionsArray)
                    completion(response)
                    break
                default:
                    
                    break
                    
                }
        
        }else{
            completion(INStringResolutionResult.needsValue())
        }
    }
    func resolveServiceName(forSendMessage intent: INSendMessageIntent, with completion: (INStringResolutionResult) -> Swift.Void){
        NSLog("resolveServiceName %@", intent.description)
        let notRequired = INStringResolutionResult.notRequired()
        completion(notRequired)
    }
    func confirm(sendMessage intent: INSendMessageIntent, completion: (INSendMessageIntentResponse) -> Swift.Void){
        completion(INSendMessageIntentResponse(code: .success, userActivity: nil))
    }
    
    // MARK: 3. Handle
    func handle(sendMessage intent: INSendMessageIntent, completion: (INSendMessageIntentResponse) -> Swift.Void) {
        if intent.recipients != nil && intent.content != nil {
            // Send the message.
            completion(INSendMessageIntentResponse(code: .success , userActivity: nil))
        }
        else {
            completion(INSendMessageIntentResponse(code: .failure, userActivity: nil))
        }
    }



}
