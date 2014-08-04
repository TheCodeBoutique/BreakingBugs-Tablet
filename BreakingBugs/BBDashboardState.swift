//
//  BBDashboardState.swift
//  BreakingBugs
//
//  Created by Chad Eubanks on 8/4/14.
//  Copyright (c) 2014 The Code Boutique. All rights reserved.
//

import UIKit

class BBDashboardState: AltoState {
    
    override func enterState()  {
        applicationDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        BBStatechart.sharedStateManager.sendEvent("hello")
    }
    
    func hello() {
        
    }
    
    override func exitState() {
        
    }
    
   
}
