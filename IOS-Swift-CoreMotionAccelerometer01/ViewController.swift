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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                self.xAccel!.text = "x: \(Double(x).rounded(toPlaces: 5))"
                self.yAccel!.text = "y: \(Double(y).rounded(toPlaces: 5))"
                self.zAccel!.text = "z: \(Double(z).rounded(toPlaces: 5))"
            }
        }
        return
    }
}

extension Double {
    //Rounds the double to the decimal places value
    func rounded(toPlaces places:Int) -> Double{
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded()/divisor
    }
}
