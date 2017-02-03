//
//  ViewController.swift
//  SGClock
//
//  Created by Jerry Zhou on 02/3.
//  Copyright © 2017 yvbbrjdr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    var timer:Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isIdleTimerDisabled=true
        label.adjustsFontSizeToFitWidth=true
        timer=Timer.init(timeInterval: 0.01, target: self, selector: #selector(self.timeout), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: RunLoopMode.commonModes)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func timeout() {
        let timeFormatter=DateFormatter.init()
        timeFormatter.dateFormat="yyyy.MM.dd HH:mm:ss:SSS"
        let str=timeFormatter.string(from: Date.init())
        label.text="AD "+str.substring(to: str.index(before: str.endIndex))
    }
}

