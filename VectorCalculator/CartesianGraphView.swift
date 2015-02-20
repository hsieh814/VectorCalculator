//
//  CartesianGraphView.swift
//  VectorCalculator
//
//  Created by Lena Hsieh on 2015-02-19.
//  Copyright (c) 2015 lhsieh. All rights reserved.
//

import UIKit

class CartesianGraphView: UIView {
    
    @IBInspectable var startColor: UIColor = UIColor.lightGrayColor()
    @IBInspectable var endColor: UIColor = UIColor.orangeColor()
    
    let topBorder:CGFloat = 30
    let bottomBorder:CGFloat = 30
    let margin:CGFloat = 30
    let maxValue = 20
    var width: CGFloat = 0
    var height: CGFloat = 0
    var graphWidth: CGFloat = 0
    var graphHeight: CGFloat = 0

    var a = Vector(x: 0, y: 0)
    var b = Vector(x: 0, y: 0)
    var c = Vector(x: 0, y: 0)
    
    override func drawRect(rect: CGRect) {
        width = rect.width
        height = rect.height
        graphWidth = width - margin*2
        graphHeight = height - topBorder - bottomBorder
        
        //set up background clipping area
        var path = UIBezierPath(roundedRect: rect,
            byRoundingCorners: UIRectCorner.AllCorners,
            cornerRadii: CGSize(width: 8.0, height: 8.0))
        path.addClip()
        
        //2 - get the current context
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.CGColor, endColor.CGColor]
        
        //3 - set up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        //4 - set up the color stops
        let colorLocations:[CGFloat] = [0.0, 1.0]
        
        //5 - create the gradient
        let gradient = CGGradientCreateWithColors(colorSpace,
            colors,
            colorLocations)
        
        //6 - draw the gradient
        var startPoint = CGPoint.zeroPoint
        var endPoint = CGPoint(x:0, y:self.bounds.height)
        CGContextDrawLinearGradient(context,
            gradient,
            startPoint,
            endPoint,
            0)
        
        //set up the points line
        var graphPathA = UIBezierPath()
        var graphPathB = UIBezierPath()
        var graphPathC = UIBezierPath()
        
        // Draw vector A
        graphPathA.moveToPoint(CGPoint(x: calculateXLocation(0), y: calculateYLocation(0)))
        graphPathA.addLineToPoint(CGPoint(x: calculateXLocation(a.x), y: calculateYLocation(a.y)))
        
        // Draw vector B
        graphPathB.moveToPoint(CGPoint(x: calculateXLocation(0), y: calculateYLocation(0)))
        graphPathB.addLineToPoint(CGPoint(x: calculateXLocation(b.x), y: calculateYLocation(b.y)))
        
        // Draw vector C
        graphPathC.moveToPoint(CGPoint(x: calculateXLocation(0), y: calculateYLocation(0)))
        graphPathC.addLineToPoint(CGPoint(x: calculateXLocation(c.x), y: calculateYLocation(c.y)))
        
        // Draw the line on top of the clipped gradient with different colors
        UIColor.cyanColor().setFill()
        UIColor.cyanColor().setStroke()
        graphPathA.lineWidth = 2.0
        graphPathA.stroke()
        
        UIColor.greenColor().setFill()
        UIColor.greenColor().setStroke()
        graphPathB.lineWidth = 2.0
        graphPathB.stroke()
        
        UIColor.yellowColor().setFill()
        UIColor.yellowColor().setStroke()
        graphPathC.lineWidth = 2.0
        graphPathC.stroke()
        
        // Draw horizontal/vertical graph lines on the top of everything
        var linePath = UIBezierPath()
        
        //horizontal-top line
        linePath.moveToPoint(CGPoint(x:margin, y: topBorder))
        linePath.addLineToPoint(CGPoint(x: width - margin, y:topBorder))
        
        //horizontal-(3/4) line
        linePath.moveToPoint(CGPoint(x:margin, y: (graphHeight*3)/4 + topBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin, y:(graphHeight*3)/4 + topBorder))
        
        //horizontal-center line
        linePath.moveToPoint(CGPoint(x:margin, y: graphHeight/2 + topBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin, y:graphHeight/2 + topBorder))
        
        //horizontal-(1/4) line
        linePath.moveToPoint(CGPoint(x:margin, y: graphHeight/4 + topBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin, y:graphHeight/4 + topBorder))
        
        //horizontal-bottom line
        linePath.moveToPoint(CGPoint(x:margin, y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin, y:height - bottomBorder))
        
        //vertical-left line
        linePath.moveToPoint(CGPoint(x:margin, y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:margin, y:topBorder))
        
        //vertical-left+5 line
        linePath.moveToPoint(CGPoint(x:margin + graphWidth/4, y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:margin + graphWidth/4, y:topBorder))
        
        //vertical-center line
        linePath.moveToPoint(CGPoint(x:margin + graphWidth/2, y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:margin + graphWidth/2, y:topBorder))
        
        //vertical-right-5 line
        linePath.moveToPoint(CGPoint(x:margin + (graphWidth*3)/4, y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:margin + (graphWidth*3)/4, y:topBorder))
        
        //vertical-right-5 line
        linePath.moveToPoint(CGPoint(x:width - margin, y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin, y:topBorder))
        
        let color = UIColor(white: 1.0, alpha: 0.3)
        color.setStroke()
        
        linePath.lineWidth = 1.0
        linePath.stroke()
    }
    
    /* Takes the x value and calculates the corresponding location on the graph */
    func calculateXLocation(x: Int) -> CGFloat {
        //Calculate gap between points (need to accomondate for width of the graph lines)
        let spacer = (self.width - self.margin*2 - 4) / 20
        var x:CGFloat = CGFloat(x) * spacer
        x += self.margin + 2
        return x
    }
    
    /* Takes the y value and calculates the corresponding location on the graph */
    func calculateYLocation(y: Int) -> CGFloat {
        var y:CGFloat = CGFloat(y) / CGFloat(self.maxValue) * self.graphHeight
        y = self.graphHeight + self.topBorder - y // Flip the graph; y starts from teh right side
        return y
    }
    
}
