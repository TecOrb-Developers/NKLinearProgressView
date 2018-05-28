//
//  NKLinearProgressView.swift
//  NKLinearProgressView
//
//  Created by TecOrb on 28/05/18.
//  Copyright © 2018 Nakul Sharma. All rights reserved.
//

import UIKit

/*
NKLinearProgressView

 */
@IBDesignable
open class NKLinearProgressView: UIView {

    @IBInspectable open var barColor: UIColor = UIColor.green
    @IBInspectable open var trackColor: UIColor = UIColor.yellow
    @IBInspectable open var barThickness: CGFloat = 10
    @IBInspectable open var barPadding: CGFloat = 0
    @IBInspectable open var trackPadding: CGFloat = 6
    @IBInspectable var progressValue: CGFloat = 50 {
        didSet {
            if (progressValue >= 100) {
                progressValue = 100
            } else if (progressValue <= 0) {
                progressValue = 0
            }
            setNeedsDisplay()
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setNeedsDisplay()
    }


    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setNeedsDisplay()
        //fatalError("init(coder:) has not been implemented")
    }

    fileprivate var trackHeight: CGFloat {
        return barThickness + trackPadding
    }

    fileprivate var trackOffset: CGFloat {
        return trackHeight / 2
    }

    open override func draw(_ rect: CGRect) {
        drawProgressView()
    }

    // Draws the progress bar and track
    func drawProgressView() {
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()

        // Progres Bar Track
        context?.setStrokeColor(trackColor.cgColor)
        context?.beginPath()
        context?.setLineWidth(trackHeight)
        context?.move(to: CGPoint(x: barPadding + trackOffset, y: frame.size.height / 2))
        context?.addLine(to: CGPoint(x: frame.size.width - barPadding - trackOffset, y: frame.size.height / 2))
        context?.setLineCap(CGLineCap.round)
        context?.strokePath()

        // Progress Bar
        let percent = self.calcualtePercentage()
        if percent > 0.0{
            context?.setStrokeColor(barColor.cgColor)
            context?.setLineWidth(barThickness)
            context?.beginPath()
            context?.move(to: CGPoint(x: barPadding + trackOffset, y: frame.size.height / 2))
            context?.addLine(to: CGPoint(x: barPadding + trackOffset + percent, y: frame.size.height / 2))
            context?.setLineCap(CGLineCap.round)
            context?.strokePath()
        }

        context?.restoreGState()
    }

    /**
     Calculates the percent value
     */
    func calcualtePercentage() -> CGFloat {
        let screenWidth = frame.size.width - (barPadding * 2) - (trackOffset * 2)
        let progress = ((progressValue / 100.0) * screenWidth)
        return progress < 0 ? 0 : progress
    }
}
