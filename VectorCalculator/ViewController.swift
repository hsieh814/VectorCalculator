//
//  ViewController.swift
//  VectorCalculator
//
//  Created by Lena Hsieh on 2015-02-17.
//  Copyright (c) 2015 lhsieh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var operations: UISegmentedControl!
    
    @IBOutlet weak var Ax: UITextField!
    @IBOutlet weak var Ay: UITextField!
    @IBOutlet weak var Bx: UITextField!
    @IBOutlet weak var By: UITextField!
    
    @IBOutlet weak var calculate: UIButton!
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var graphView: CartesianGraphView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // So that the keyboard dismiss when touching the view
        Ax.delegate = self;
        Ay.delegate = self;
        Bx.delegate = self;
        By.delegate = self;
        
        calculate.layer.cornerRadius = 8.0;
        
        result.text = "";
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startCalculation(sender: UIButton) {
        var ax = Ax.text.toInt();
        var ay = Ay.text.toInt();
        var bx = Bx.text.toInt();
        var by = By.text.toInt();
        
        let a = Vector(x: ax!, y: ay!, z: 0);
        let b = Vector(x: bx!, y: by!, z: 0);
        
        if (validateCoordinates(a) && validateCoordinates(b)) {
        
            switch(operations.selectedSegmentIndex) {
            case 0:
                // Vector Addition
                let v = vectorAddition(a, b: b);
                result.text = ("\(v.x), \(v.y), \(v.z)");
                break;
            case 1:
                // Scalar Product
                result.text = String(scalarProduct(a, b: b));
                break;
            case 2:
                // Vector Product
                let v = vectorProduct(a, b: b);
                result.text = ("\(v.x), \(v.y), \(v.z)");
                break;
            default:
                println("Default");
                break;
            }
            
        }
    }
    
    /* Validates that x, y and z are greater or equal to -100 and less than or equal to 100 */
    func validateCoordinates(v: Vector) -> Bool {
        if (v.x < -100 || v.x > 100 || v.y < -100 || v.y > 100 || v.z < -100 || v.z > 100) {
            return false;
        }
        return true;
    }
    
    /* Calculates vector addition */
    func vectorAddition(a: Vector, b: Vector) -> Vector {
        println("Vector Addition");
        return Vector(x: a.x + b.x, y: a.y + b.y, z: 0);
    }
    
    /* Calculates scalar product (dot product) */
    func scalarProduct(a: Vector, b: Vector) -> Int {
        println("Scalar Product");
        return a.x * b.x + a.y * b.y;
    }
    
    /* Calculates vector product (cross product) */
    func vectorProduct(a: Vector, b: Vector) -> Vector {
        println("Vector Product");
        return Vector(x: a.y * b.z - a.z * b.y,
            y: a.z * b.x - a.x * b.z,
            z: a.x * b.y - a.y * b.x);
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        println("resign text field");
        textField.resignFirstResponder();
        return true;
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true);
    }

}

