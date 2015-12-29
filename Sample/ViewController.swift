//
//  ViewController.swift
//  Sample
//
//  Created by kyo__hei on 2015/12/29.
//  Copyright (c) 2015 kyo__hei. All rights reserved.
//

import UIKit
import KYNavigationProgress

class ViewController: UIViewController {

    @IBAction func didTapUpButton(sender: UIButton) {
        let progress = navigationController!.progress
        navigationController!.setProgress(progress + 0.1, animated: true)
    }
    
    @IBAction func didTapFinishButton(sender: UIButton) {
        navigationController!.finishProgress()
    }
    
    @IBAction func didTapCancelButton(sender: UIButton) {
        navigationController!.cancelProgress()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController!.progressTintColor = UIColor.redColor()
        navigationController!.trackTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.2)
        navigationController!.progressHeight = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

