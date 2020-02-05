//
//  ViewController.swift
//  IOS-Swift-CoreMotionAccelerometer01
//
//  Created by Diego Hernandez on 2/4/20.
//  Copyright © 2020 Diego. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController{
    
    @IBOutlet weak var xAccel: UITextField!
    @IBOutlet weak var yAccel: UITextField!
    @IBOutlet weak var zAccel: UITextField!
    
    var motion = CMMotionManager()
    var stopped = true
    
    var px = 0.0
    var py = 0.0
    var pz = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        view.addGestureRecognizer(tap)
        myAccelerometer()
    }
    
    func myAccelerometer(){
        motion.accelerometerUpdateInterval = 0.5
        motion.startAccelerometerUpdates(to: OperationQueue.current!)
        { (data, error) in print(data as Any)
            if let trueData = data {
                self.view.reloadInputViews()
                let x = trueData.acceleration.x
                let y = trueData.acceleration.y
                let z = trueData.acceleration.z
                self.px = (Double(x).rounded(toPlaces: 4))
                self.py = (Double(y).rounded(toPlaces: 4))
                self.pz = (Double(z).rounded(toPlaces: 4))
            }
        }
        return
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer){
        guard sender.view != nil else {return}
        if sender.state == .ended{
            self.xAccel!.text = "x: \(px)"
            self.yAccel!.text = "y: \(py)"
            self.zAccel!.text = "z: \(pz)"
        }
    }
}

extension Double {
    func rounded(toPlaces places:Int) -> Double{
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded()/divisor
    }
}
