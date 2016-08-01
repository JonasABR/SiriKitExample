//
//  IntentHandler.swift
//  SerjaoTabajaraSiriIntent
//
//  Created by Avenue Code on 7/14/16.
//  Copyright © 2016 jonas. All rights reserved.
//

import Intents

// As an example, this class is set up to handle the Workout intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Start my workout using <myApp>"
// "Pause my workout using <myApp>"
// "Resume my workout using <myApp>"
// "Cancel my workout using <myApp>"
// "End my workout using <myApp>"

class IntentHandler: INExtension, INStartWorkoutIntentHandling {
    
    override func handler(for intent: INIntent) -> AnyObject {
        if intent is INSendMessageIntent{
            return SerjaoIntentSendMessage()
        }else{
            return self;
        }
    }
    
    
    func handle(startWorkout intent: INStartWorkoutIntent, completion: (INStartWorkoutIntentResponse) -> Swift.Void){
        
        let results = INStartWorkoutIntentResponse(code: .ready, userActivity: nil)
        completion(results)
    
    }
    
    func confirm(startWorkout intent: INStartWorkoutIntent, completion: (INStartWorkoutIntentResponse) -> Swift.Void){
        let results = INStartWorkoutIntentResponse(code: .ready, userActivity: nil)
        completion(results)

    
    }
    
    
    func resolveWorkoutName(forStartWorkout intent: INStartWorkoutIntent, with completion: (INSpeakableStringResolutionResult) -> Swift.Void){
        
        NSLog("atividade de nome /(workoutName)")
        
        let name =  INSpeakableString(identifier: "work_1", spokenPhrase: "night run", pronunciationHint:nil)
        
        let results = INSpeakableStringResolutionResult.confirmationRequired(with: name)
        
        completion(results)
    
    }
    
    
    
}

