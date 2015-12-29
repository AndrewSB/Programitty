//
//  DetailViewController.swift
//  Programitty
//
//  Created by Andrew Breckenridge on 12/26/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    var program: Program? {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

