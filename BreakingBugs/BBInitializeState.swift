//
//  BBInitializeState.swift
//  BreakingBugs
//
//  Created by Chad Eubanks on 8/4/14.
//  Copyright (c) 2014 The Code Boutique. All rights reserved.
//

import UIKit

class BBInitializeState: AltoState {
    
    override func enterState() {
        applicationDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        BBStatechart.sharedStateManager.sendEvent("createApplicationWindow")
    }
    
    
    func createApplicationWindow() {
        applicationDelegate!.window = UIWindow(frame: CGRectZero)
        BBStatechart.sharedStateManager.sendEvent("designApplicationWindow")
    }
    
    func createRootContainerViewcontroller() {
        applicationDelegate!.rootContainerViewController = BBRootContainerViewController(viewName: BBRootContainerView(frame: CGRectZero))
         BBStatechart.sharedStateManager.sendEvent("designRootContainerViewController")
    }
    
    func designApplicationWindow() {
        /* 
            Since we default to landscape mode... we need to update our windows' bounds.
            The mainScreen().bounds reflects a sceen in portrait mode so we invert
            the hight and width.
            This is a simulator bug... uncomment below if using sim. :(
        */
        
        /*  ========= USE FOR SIM ONLY =========
        let rect = UIScreen.mainScreen().bounds
        var updatedRect = rect
        
        updatedRect.size.height = rect.size.width
        updatedRect.size.width = rect.size.height
        applicationDelegate!.window!.frame = updatedRect
        
        applicationDelegate!.window!.frame = updatedRect
        */
        
        applicationDelegate!.window!.frame = UIScreen.mainScreen().bounds // if this is the sim... dont use this line.
        applicationDelegate!.window!.backgroundColor = UIColor.whiteColor()
        BBStatechart.sharedStateManager.sendEvent("createRootContainerViewcontroller")
    }
    
    func designRootContainerViewController() {
        applicationDelegate!.rootContainerViewController!.view.frame = applicationDelegate!.window!.frame
        BBStatechart.sharedStateManager.sendEvent("appendRootViewController")
    }
    
    func appendApplicationWindow() {
        applicationDelegate!.window!.makeKeyAndVisible()
        BBStatechart.sharedStateManager.goToState(BBDashboardState())
    }
    
    func appendRootViewController() {
        applicationDelegate!.window!.rootViewController = applicationDelegate!.rootContainerViewController
        BBStatechart.sharedStateManager.sendEvent("appendApplicationWindow")
    }
    
    override func exitState() {
        
    }
   
}
