//
//  ViewController.swift
//  NKLinearProgressView
//
//  Created by TecOrb on 28/05/18.
//  Copyright © 2018 Nakul Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //by making IBOutlet
    @IBOutlet weak var progressView : NKLinearProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.barColor = UIColor.green
        progressView.trackColor = UIColor.gray
        progressView.barThickness = 10
        progressView.barPadding = 0
        progressView.trackPadding = 6
        progressView.progressValue = 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

