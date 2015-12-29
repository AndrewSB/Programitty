//
//  DetailViewController.swift
//  Programitty
//
//  Created by Andrew Breckenridge on 12/26/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView! {
        didSet {
            webView.backgroundColor = .clearColor()
            webView.scalesPageToFit = true
        }
    }

    var program: Program? {
        didSet { print("url is \(program!.program.url)") }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = NSURL(string: program!.program.url!) {
            webView.loadRequest(NSURLRequest(URL: url))
        }

    }

}

