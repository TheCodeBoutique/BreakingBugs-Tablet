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
        BBStatechart.sharedStateManager.sendEvent("createDashboardViewController")
    }
    
    func createDashboardViewController() {
        applicationDelegate!.centerViewController = BBDashboardViewController(viewName: BBDashboardView(frame: CGRectZero))
        BBStatechart.sharedStateManager.sendEvent("designDashboardViewController")
    }
    
    func designDashboardViewController() {
        applicationDelegate!.centerViewController!.view.frame = applicationDelegate!.window!.frame
        BBStatechart.sharedStateManager.sendEvent("appenddashboardViewController")
    }
    
    func appenddashboardViewController() {
        applicationDelegate!.rootContainerViewController?.view.addSubview(applicationDelegate!.centerViewController!.view)
    }
    
    override func exitState() {
        
    }
    
   
}
