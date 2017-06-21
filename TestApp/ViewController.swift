//
//  ViewController.swift
//  TestApp
//
//  Created by Eric Peng on 6/16/17.
//
//

import UIKit

class ViewController: UIViewController {
    var simpleBluetoothIO: SimpleBluetoothIO!
    
    @IBOutlet weak var ledToggleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        simpleBluetoothIO = SimpleBluetoothIO(serviceUUID: "BLUETOOTH ID", delegate: self)
        }
    
        @IBAction func ledToggleButtonDown(_sender: UIButton) {
            simpleBluetoothIO.writeValue(value: 1)
        }
    
        @IBAction func ledToggleButtonUp(_sender: UIButton) {
            simpleBluetoothIO.writeValue(value: 0)
        }
    }

extension ViewController: SimpleBluetoothIODelegate {
    func simpleBluetoothIO(simpleBluetoothIO: SimpleBluetoothIO, didReceiveValue value: Int8) {
        if value > 0 {
            view.backgroundColor = UIColor.yellow
        } else {
            view.backgroundColor = UIColor.black
        }
    }
}


