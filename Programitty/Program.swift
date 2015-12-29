//
//  Program.swift
//  Programitty
//
//  Created by Andrew Breckenridge on 12/29/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation

import Parse

class Program: PFObject, PFSubclassing {
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Program"
    }
    
    @NSManaged var name: String!
    @NSManaged var location: String!
    @NSManaged var city: String!
    @NSManaged var state: String!
    @NSManaged var zip: String!
    @NSManaged var date: NSDate!
    @NSManaged var endDate: NSDate!
    @NSManaged var program: PFFile!
}