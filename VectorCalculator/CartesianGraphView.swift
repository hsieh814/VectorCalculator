//
//  CartesianGraphView.swift
//  VectorCalculator
//
//  Created by Lena Hsieh on 2015-02-19.
//  Copyright (c) 2015 lhsieh. All rights reserved.
//

import UIKit

class CartesianGraphView: UIView {
    
    @IBInspectable var startColor: UIColor = UIColor.orangeColor()
    @IBInspectable var endColor: UIColor = UIColor.orangeColor()
    
    let topBorder:CGFloat = 30
    let bottomBorder:CGFloat = 30
    let margin:CGFloat = 30
    let maxValue = 20

    var graphPoints:[Int] = [5, 0, 6, 4, 20, 8, 3]
    var a = Vector(x: 0, y: 0, z: 0)
    var b = Vector(x: 0, y: 0, z: 0)
    var c = Vector(x: 0, y: 0, z: 0)
    
    override func drawRect(rect: CGRect) {
        let width = rect.width
        let height = rect.height
        
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

        //calculate the x point
        var columnXPoint = { (column:Int) -> CGFloat in
            //Calculate gap between points
            let spacer = (width - self.margin*2 - 4) / 20
            var x:CGFloat = CGFloat(column) * spacer
            x += self.margin + 2
            return x
        }
        
        // calculate the y point
        let graphHeight = height - topBorder - bottomBorder
        let graphWidth = width - margin*2
        var columnYPoint = { (graphPoint:Int) -> CGFloat in
            var y:CGFloat = CGFloat(graphPoint) / CGFloat(self.maxValue) * graphHeight
            y = graphHeight + self.topBorder - y // Flip the graph
            return y
        }
        
        // draw the line graph
        UIColor.whiteColor().setFill()
        UIColor.whiteColor().setStroke()
        
        //set up the points line
        var graphPathA = UIBezierPath()
        var graphPathB = UIBezierPath()
        var graphPathC = UIBezierPath()
        
        // Draw vector A
        graphPathA.moveToPoint(CGPoint(x: 0, y: 0))
        graphPathA.addLineToPoint(CGPoint(x: a.x, y: a.y))
        
        // Draw vector B
        graphPathB.moveToPoint(CGPoint(x: 0, y: 0))
        graphPathB.addLineToPoint(CGPoint(x: b.x, y: b.y))
        
        // Draw vector B
        graphPathC.moveToPoint(CGPoint(x: 0, y: 0))
        graphPathC.addLineToPoint(CGPoint(x: c.x, y: c.y))
        
        //add points for each item in the graphPoints array
        //at the correct (x, y) for the point
//        for i in 1..<graphPoints.count {
//            let nextPoint = CGPoint(x:columnXPoint(i),
//                y:columnYPoint(graphPoints[i]))
//            graphPath.addLineToPoint(nextPoint)
//        }
        
        //Create the clipping path for the graph gradient
        
        //1 - save the state of the context (commented out for now)
        CGContextSaveGState(context)
        
        //2 - make a copy of the path
//        var clippingPathA = graphPathA.copy() as UIBezierPath
//        var clippingPathB = graphPathB.copy() as UIBezierPath
//        var clippingPathC = graphPathC.copy() as UIBezierPath
//
//        //3 - add lines to the copied path to complete the clip area
//        clippingPathA.addLineToPoint(CGPoint(
//            x: columnXPoint(graphPoints.count - 1),
//            y:height))
//        clippingPath.addLineToPoint(CGPoint(
//            x:columnXPoint(0),
//            y:height))
//        clippingPath.closePath()
//        
//        4 - add the clipping path to the context
//        clippingPath.addClip()
        
        let highestYPoint = columnYPoint(maxValue)
        startPoint = CGPoint(x:margin, y: highestYPoint)
        endPoint = CGPoint(x:margin, y:self.bounds.height)
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0)
        CGContextRestoreGState(context)
        
        //draw the line on top of the clipped gradient
        graphPathA.lineWidth = 2.0
        graphPathA.stroke()
        graphPathB.lineWidth = 2.0
        graphPathB.stroke()
        graphPathC.lineWidth = 2.0
        graphPathC.stroke()
        
//        //Draw the circles on top of graph stroke
//        for i in 0..<graphPoints.count {
//            var point = CGPoint(x:columnXPoint(i), y:columnYPoint(graphPoints[i]))
//            point.x -= 5.0/2
//            point.y -= 5.0/2
//            
//            let circle = UIBezierPath(ovalInRect:
//                CGRect(origin: point,
//                    size: CGSize(width: 5.0, height: 5.0)))
//            circle.fill()
//        }
        
        //Draw horizontal/vertical graph lines on the top of everything
        var linePath = UIBezierPath()
        
        //top line
        linePath.moveToPoint(CGPoint(x:margin, y: topBorder))
        linePath.addLineToPoint(CGPoint(x: width - margin, y:topBorder))
        
        //(3/4) line
        linePath.moveToPoint(CGPoint(x:margin, y: (graphHeight*3)/4 + topBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin, y:(graphHeight*3)/4 + topBorder))
        
        //center line
        linePath.moveToPoint(CGPoint(x:margin, y: graphHeight/2 + topBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin, y:graphHeight/2 + topBorder))
        
        //(1/4) line
        linePath.moveToPoint(CGPoint(x:margin, y: graphHeight/4 + topBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin, y:graphHeight/4 + topBorder))
        
        //bottom line
        linePath.moveToPoint(CGPoint(x:margin, y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin, y:height - bottomBorder))
        
        //left line
        linePath.moveToPoint(CGPoint(x:margin, y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:margin, y:topBorder))
        
        //left+5 line
        linePath.moveToPoint(CGPoint(x:margin + graphWidth/4, y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:margin + graphWidth/4, y:topBorder))
        
        //center line
        linePath.moveToPoint(CGPoint(x:margin + graphWidth/2, y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:margin + graphWidth/2, y:topBorder))
        
        //right-5 line
        linePath.moveToPoint(CGPoint(x:margin + (graphWidth*3)/4, y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:margin + (graphWidth*3)/4, y:topBorder))
        
        //right-5 line
        linePath.moveToPoint(CGPoint(x:width - margin, y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin, y:topBorder))
        
        let color = UIColor(white: 1.0, alpha: 0.3)
        color.setStroke()
        
        linePath.lineWidth = 1.0
        linePath.stroke()

    }
    
}
