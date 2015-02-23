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
    @IBOutlet weak var Cx: UITextField!
    @IBOutlet weak var Cy: UITextField!
    
    @IBOutlet weak var CLabel: UILabel!
    @IBOutlet weak var CxLabel: UILabel!
    @IBOutlet weak var CyLabel: UILabel!
    
    @IBOutlet weak var calculate: UIButton!
    @IBOutlet weak var result: UILabel!
    
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
    
    /* Called when user switches segment control */
    @IBAction func changeOperation(sender: AnyObject) {
        if (operations.selectedSegmentIndex == 0) {
            hideCVectorInputs(false)
        } else {
            hideCVectorInputs(true)
        }
    }
    
    /* Hide C vector inputs and clear text */
    func hideCVectorInputs(hide: Bool) {
        if (hide) {
            Cx.hidden = true
            Cy.hidden = true
            Cx.text = ""
            Cy.text = ""
            CxLabel.hidden = true
            CyLabel.hidden = true
            CLabel.hidden = true
        } else {
            Cx.hidden = false
            Cy.hidden = false
            CxLabel.hidden = false
            CyLabel.hidden = false
            CLabel.hidden = false
        }
    }

    @IBAction func startCalculation(sender: UIButton) {
        // Clear the graph
        var v = Vector(x: 0, y: 0)
        graphView.a = v
        graphView.b = v
        graphView.c = v
        graphView.setNeedsDisplay()

        // Grab values from textfields
        var ax = Ax.text?.toInt()
        var ay = Ay.text?.toInt()
        var bx = Bx.text?.toInt()
        var by = By.text?.toInt()
        var cx = Cx.text?.toInt()
        var cy = Cy.text?.toInt()
        
        // Checks that the inputs are not nil and are in the valid range
        if (operations.selectedSegmentIndex == 0) {
            if ((cx != nil || cy != nil) && !validateCoordinates(cx, y: cy)) {
                result.text = "Please enter value between 0 and 20"
                return
            }
        }
        if (!validateCoordinates(ax, y: ay) || !validateCoordinates(bx, y: by)) {
            result.text = "Please enter value between 0 and 20"
            return
        }
        
        let a = createVectorFromInputs(ax, y: ay)
        let b = createVectorFromInputs(bx, y: by)
        let c = createVectorFromInputs(cx, y: cy)
        
        // Update graph
        graphView.a = a
        graphView.b = b
        graphView.c = c
        graphView.setNeedsDisplay()
        
        result.text = performOperation(operations.selectedSegmentIndex, a: a, b: b, c: c)
    }
    
    /* Calls the corresponding method for calculations */
    func performOperation(op: Int, a: Vector, b: Vector, c: Vector) -> String {
        var msg = ""
        switch(op) {
        case 0:
            // Vector Addition
            let v = vectorAddition(a, b: b, c: c)
            msg = ("\(v.x), \(v.y)")
            break
        case 1:
            // Scalar Product
            msg = "\(scalarProduct(a, b: b))"
            break
        case 2:
            // Vector Product
            let v = vectorProduct(a, b: b)
            msg = ("\(v)")
            break
        default:
            msg = "ERROR"
            break;
        }
        return msg
    }
    
    /* Returns a vector build from input or Vector(0, 0) if either params are nil or invalid */
    func createVectorFromInputs(x: Int?, y: Int?) -> Vector {
        if (validateCoordinates(x, y: y)) {
            return Vector(x: x!, y: y!)
        } else {
            return Vector(x: 0, y: 0)
        }
    }

    /* Validates that x and y are not nil and are greater or equal to 0 and less than or equal to 20 */
    func validateCoordinates(x: Int?, y: Int?) -> Bool {
        if (x == nil || y == nil) {
            return false;
        } else if (x < 0 || x > 20 || y < 0 || y > 20) {
            return false;
        }
        return true
    }
    
    /* Calculates vector addition */
    func vectorAddition(a: Vector, b: Vector, c: Vector) -> Vector {
        println("Vector Addition");
        return Vector(x: a.x + b.x + c.x, y: a.y + b.y + c.y);
    }
    
    /* Calculates scalar product (dot product) */
    func scalarProduct(a: Vector, b: Vector) -> Int {
        println("Scalar Product");
        return a.x * b.x + a.y * b.y;
    }
    
    /* Calculates vector product (cross product) */
    func vectorProduct(a: Vector, b: Vector) -> Int {
        println("Vector Product");
        return a.x * b.y - a.y * b.x
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

