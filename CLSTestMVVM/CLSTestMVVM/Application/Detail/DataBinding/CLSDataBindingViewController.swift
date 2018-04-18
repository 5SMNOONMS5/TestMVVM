//
//  CLSDataBindingViewController.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 18/04/2018.
//  Copyright © 2018 StephenChen. All rights reserved.
//

import UIKit

class CLSDataBindingViewController: UIViewController {

    @IBOutlet weak var progress: UIProgressView!
    
    @IBOutlet weak var lbl: UILabel!
    
    fileprivate var viewModel: CLSDataBindingViewModel = CLSDataBindingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbl.bindingWith ~~> viewModel.text
        self.progress.bindingWith ~~> viewModel.progressValue
    }

    @IBAction func actionStart(_ sender: Any) {
        self.viewModel.start()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
