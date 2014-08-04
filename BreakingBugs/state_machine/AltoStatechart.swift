//
//  AltoStatechart.swift
//  BreakingBugs
//
//  Created by chad eubanks on 7/28/14.
//  Copyright (c) 2014 The Code Boutique. All rights reserved.
//

import Foundation
import UIKit

class AltoStatechart {
    class var sharedStateManager: AltoStatechart {
        
    struct Static {
        static var instance: AltoStatechart?
        static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = AltoStatechart()
        }
        
        return Static.instance!
    }
    
    var currentState: AltoState?
    
    func setCurrentstate(state:AltoState) {
        currentState = state
    }
    
    func goToState(state:AltoState) {
        
        // if we have a current state... call its exit method
        if (currentState) {
            currentState?.exitState()
        }
        
        // update our currentState to the state we are going to
        currentState = state
        
        // enter our new state
        state.enterState()
    }
    
    func sendEvent (selector:Selector) {
        // make sure the currentState responds the the given selector
        if (currentState?.respondsToSelector(selector)) {
            UIApplication.sharedApplication().sendAction(selector, to:currentState,from: self, forEvent: nil)
        } else {
            
        }
    }
}
