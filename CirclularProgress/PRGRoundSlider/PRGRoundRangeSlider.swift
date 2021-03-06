//
//  SliderKit.swift
//  PRGRoundSlider
//
//  Created by John Spiropoulos on 20/03/2017.
//  Copyright © 2017 Programize LLC. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//



import UIKit

public class SliderKit : NSObject {
    
    //// Cache
    
    private struct Cache {
        static let darkBlueColor: UIColor = UIColor(red: 0.329, green: 0.408, blue: 0.565, alpha: 1.000)
        static let darkPinkColor: UIColor = UIColor(red: 0.824, green: 0.390, blue: 0.382, alpha: 1.000)
    }
    
    //// Colors
    
    @objc public dynamic class var darkBlueColor: UIColor { return Cache.darkBlueColor }
    @objc public dynamic class var darkPinkColor: UIColor { return Cache.darkPinkColor }
    
    //// Drawing Methods
    
    @objc public dynamic class func drawSlider(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 90, height: 94), resizing: ResizingBehavior = .aspectFit, strokeColor: UIColor = UIColor(red: 0.259, green: 0.325, blue: 0.498, alpha: 1.000), thumbColor: UIColor = UIColor(red: 0.800, green: 0.322, blue: 0.322, alpha: 1.000), gradientBottomColor: UIColor = UIColor(red: 0.835, green: 0.412, blue: 0.404, alpha: 1.000), messageColor: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000), innerStrokeColor: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000), startEndTextColor: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000), progress: CGFloat = 0.162, endAngle: CGFloat = -30, startAngle: CGFloat = 210, strokeWidth: CGFloat = 2, indicatorMessage: String = "", startText: String = "start", endText: String = "end") {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 90, height: 94), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 90, y: resizedFrame.height / 94)
        
        
        
        //// Gradient Declarations
        let gradient = CGGradient(colorsSpace: nil, colors: [strokeColor.cgColor, gradientBottomColor.cgColor] as CFArray, locations: [0, 0.99])!
        
        //// Variable Declarations
        let endFieldRotation: CGFloat = 360 - endAngle
        let selectionAngle: CGFloat = -1 * progress * (startAngle + abs(endAngle)) + startAngle
        let startFieldRotation: CGFloat = 360 - startAngle
        
        //// ovalBar Drawing
        let ovalBarRect = CGRect(x: 4.5, y: 5.5, width: 81, height: 81)
        let ovalBarPath = UIBezierPath()
        ovalBarPath.addArc(withCenter: CGPoint(x: ovalBarRect.midX, y: ovalBarRect.midY), radius: ovalBarRect.width / 2, startAngle: -startAngle * CGFloat.pi/180, endAngle: -endAngle * CGFloat.pi/180, clockwise: true)
        
        strokeColor.setStroke()
        ovalBarPath.lineWidth = strokeWidth
        ovalBarPath.lineCapStyle = .round
        ovalBarPath.stroke()
        
        
        //// endPoint Drawing
        context.saveGState()
        context.translateBy(x: 45, y: 46)
        context.rotate(by: -endAngle * CGFloat.pi/180)
        
        let endPointPath = UIBezierPath(ovalIn: CGRect(x: 36.3, y: -4.13, width: 8, height: 8))
        strokeColor.setFill()
        endPointPath.fill()
        
        context.restoreGState()
        
        
        //// startPoint Drawing
        context.saveGState()
        context.translateBy(x: 45, y: 46)
        context.rotate(by: -(startAngle - 360) * CGFloat.pi/180)
        
        let startPointPath = UIBezierPath(ovalIn: CGRect(x: 36.3, y: -4.13, width: 8, height: 8))
        strokeColor.setFill()
        startPointPath.fill()
        
        context.restoreGState()
        
        
        //// endFieldGroup
        context.saveGState()
        context.translateBy(x: 45, y: 46.5)
        context.rotate(by: -endAngle * CGFloat.pi/180)
        
        
        
        //// endTextField Drawing
        context.saveGState()
        context.translateBy(x: 43.59, y: 6.88)
        context.rotate(by: -endFieldRotation * CGFloat.pi/180)
        
        let endTextFieldRect = CGRect(x: -8, y: -3.5, width: 16, height: 7)
        let endTextFieldStyle = NSMutableParagraphStyle()
        endTextFieldStyle.alignment = .center
        let endTextFieldFontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 5), NSAttributedStringKey.foregroundColor: startEndTextColor, NSAttributedStringKey.paragraphStyle: endTextFieldStyle]
        
        let endTextFieldTextHeight: CGFloat = endText.boundingRect(with: CGSize(width: endTextFieldRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: endTextFieldFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: endTextFieldRect)
        endText.draw(in: CGRect(x: endTextFieldRect.minX, y: endTextFieldRect.minY + (endTextFieldRect.height - endTextFieldTextHeight) / 2, width: endTextFieldRect.width, height: endTextFieldTextHeight), withAttributes: endTextFieldFontAttributes)
        context.restoreGState()
        
        context.restoreGState()
        
        
        
        context.restoreGState()
        
        
        //// startFieldGroup
        context.saveGState()
        context.translateBy(x: 45, y: 46.5)
        context.rotate(by: -(startAngle - 360) * CGFloat.pi/180)
        
        
        
        //// startTextField Drawing
        context.saveGState()
        context.translateBy(x: 43.96, y: -7.06)
        context.rotate(by: -startFieldRotation * CGFloat.pi/180)
        
        let startTextFieldRect = CGRect(x: -8.17, y: -3.59, width: 16.33, height: 7)
        let startTextFieldStyle = NSMutableParagraphStyle()
        startTextFieldStyle.alignment = .center
        let startTextFieldFontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 5), NSAttributedStringKey.foregroundColor: startEndTextColor, NSAttributedStringKey.paragraphStyle: startTextFieldStyle]
        
        let startTextFieldTextHeight: CGFloat = startText.boundingRect(with: CGSize(width: startTextFieldRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: startTextFieldFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: startTextFieldRect)
        startText.draw(in: CGRect(x: startTextFieldRect.minX, y: startTextFieldRect.minY + (startTextFieldRect.height - startTextFieldTextHeight) / 2, width: startTextFieldRect.width, height: startTextFieldTextHeight), withAttributes: startTextFieldFontAttributes)
        context.restoreGState()
        
        context.restoreGState()
        
        
        
        context.restoreGState()
        
        
        //// Oval Drawing
//        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 16.5, y: 17.5, width: 56, height: 56))
//        context.saveGState()
//        ovalPath.addClip()
//        context.drawLinearGradient(gradient, start: CGPoint(x: 44.5, y: 17.5), end: CGPoint(x: 44.5, y: 73.5), options: [])
//        context.restoreGState()
        
        
        //// Oval 2 Drawing
        let oval2Rect = CGRect(x: 19.5, y: 21, width: 50, height: 49)
        let oval2Path = UIBezierPath(ovalIn: oval2Rect)
        innerStrokeColor.setStroke()
        oval2Path.lineWidth = 1
        oval2Path.stroke()
        let oval2Style = NSMutableParagraphStyle()
        oval2Style.alignment = .center
        let oval2FontAttributes = [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue", size: 8)!, NSAttributedStringKey.foregroundColor: messageColor, NSAttributedStringKey.paragraphStyle: oval2Style]
        
        let oval2TextHeight: CGFloat = indicatorMessage.boundingRect(with: CGSize(width: oval2Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: oval2FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: oval2Rect)
        indicatorMessage.draw(in: CGRect(x: oval2Rect.minX, y: oval2Rect.minY + (oval2Rect.height - oval2TextHeight) / 2, width: oval2Rect.width, height: oval2TextHeight), withAttributes: oval2FontAttributes)
        context.restoreGState()
        
        
        //// selectionThumb Drawing
        context.saveGState()
        context.translateBy(x: 45, y: 46)
        context.rotate(by: -selectionAngle * CGFloat.pi/180)
        
        let selectionThumbPath = UIBezierPath(ovalIn: CGRect(x: 36.3, y: -4.13, width: 9, height: 9))
        thumbColor.setFill()
        selectionThumbPath.fill()
        
        context.restoreGState()
        
        ///
        let selectionStartAngle: CGFloat = -1 * 0.001 * (startAngle + abs(endAngle)) + startAngle
        let selectionEndAngle: CGFloat = -1 * progress * (startAngle + abs(endAngle)) + startAngle
        
        let isBarVisible = 0.001 < progress
        let isInvertedBarVisible = progress < 0.001
        
        if isBarVisible {
            let selectionBarRect = CGRect(x: 4.5, y: 5.5, width: 81, height: 81)
            let selectionBarPath = UIBezierPath()
            selectionBarPath.addArc(withCenter: CGPoint(x: selectionBarRect.midX, y: selectionBarRect.midY), radius: selectionBarRect.width / 2, startAngle: -selectionStartAngle * CGFloat.pi/180, endAngle: -selectionEndAngle * CGFloat.pi/180, clockwise: true)
            
            thumbColor.setStroke()
            selectionBarPath.lineWidth = strokeWidth
            selectionBarPath.lineCapStyle = .round
            selectionBarPath.stroke()
        }
        
        if (isInvertedBarVisible) {
            //// invertedSelectionBar Drawing
            let invertedSelectionBarRect = CGRect(x: 4.5, y: 5.5, width: 81, height: 81)
            let invertedSelectionBarPath = UIBezierPath()
            invertedSelectionBarPath.addArc(withCenter: CGPoint(x: invertedSelectionBarRect.midX, y: invertedSelectionBarRect.midY), radius: invertedSelectionBarRect.width / 2, startAngle: -selectionEndAngle * CGFloat.pi/180, endAngle: -selectionStartAngle * CGFloat.pi/180, clockwise: true)
            
            thumbColor.setStroke()
            invertedSelectionBarPath.lineWidth = strokeWidth
            invertedSelectionBarPath.lineCapStyle = .round
            invertedSelectionBarPath.stroke()
        }
        ///
        
        context.restoreGState()
        
    }
    
    @objc public dynamic class func drawRangeSlider(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 90, height: 94), resizing: ResizingBehavior = .aspectFit, strokeColor: UIColor = UIColor(red: 0.259, green: 0.325, blue: 0.498, alpha: 1.000), thumbColor: UIColor = UIColor(red: 0.800, green: 0.322, blue: 0.322, alpha: 1.000), gradientBottomColor: UIColor = UIColor(red: 0.835, green: 0.412, blue: 0.404, alpha: 1.000), messageColor: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000), innerStrokeColor: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000), startEndTextColor: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000), endAngle: CGFloat = -30, startAngle: CGFloat = 210, strokeWidth: CGFloat = 2, indicatorMessage: String = "", startText: String = "start", endText: String = "end", startValue: CGFloat = 0.351, endValue: CGFloat = 0.708) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 90, height: 94), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 90, y: resizedFrame.height / 94)
        
        
        
        //// Gradient Declarations
        let gradient = CGGradient(colorsSpace: nil, colors: [strokeColor.cgColor, gradientBottomColor.cgColor] as CFArray, locations: [0, 0.99])!
        
        //// Variable Declarations
        let endFieldRotation: CGFloat = 360 - endAngle
        let startFieldRotation: CGFloat = 360 - startAngle
        let selectionStartAngle: CGFloat = -1 * startValue * (startAngle + abs(endAngle)) + startAngle
        let selectionEndAngle: CGFloat = -1 * endValue * (startAngle + abs(endAngle)) + startAngle
        let isBarVisible = startValue < endValue
        let isInvertedBarVisible = endValue < startValue
        
        //// ovalBar Drawing
        let ovalBarRect = CGRect(x: 4.5, y: 5.5, width: 81, height: 81)
        let ovalBarPath = UIBezierPath()
        ovalBarPath.addArc(withCenter: CGPoint(x: ovalBarRect.midX, y: ovalBarRect.midY), radius: ovalBarRect.width / 2, startAngle: -startAngle * CGFloat.pi/180, endAngle: -endAngle * CGFloat.pi/180, clockwise: true)
        
        strokeColor.setStroke()
        ovalBarPath.lineWidth = strokeWidth
        ovalBarPath.lineCapStyle = .round
        ovalBarPath.stroke()
        
        
        //// endPoint Drawing
        context.saveGState()
        context.translateBy(x: 45, y: 46)
        context.rotate(by: -endAngle * CGFloat.pi/180)
        
        let endPointPath = UIBezierPath(ovalIn: CGRect(x: 36.3, y: -4.13, width: 8, height: 8))
        strokeColor.setFill()
        endPointPath.fill()
        
        context.restoreGState()
        
        
        //// startPoint Drawing
        context.saveGState()
        context.translateBy(x: 45, y: 46)
        context.rotate(by: -(startAngle - 360) * CGFloat.pi/180)
        
        let startPointPath = UIBezierPath(ovalIn: CGRect(x: 36.3, y: -4.13, width: 8, height: 8))
        strokeColor.setFill()
        startPointPath.fill()
        
        context.restoreGState()
        
        
        //// endFieldGroup
        context.saveGState()
        context.translateBy(x: 45, y: 46.5)
        context.rotate(by: -endAngle * CGFloat.pi/180)
        
        
        
        //// endTextField Drawing
        context.saveGState()
        context.translateBy(x: 43.59, y: 6.88)
        context.rotate(by: -endFieldRotation * CGFloat.pi/180)
        
        let endTextFieldRect = CGRect(x: -8, y: -3.5, width: 16, height: 7)
        let endTextFieldStyle = NSMutableParagraphStyle()
        endTextFieldStyle.alignment = .center
        let endTextFieldFontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 5), NSAttributedStringKey.foregroundColor: startEndTextColor, NSAttributedStringKey.paragraphStyle: endTextFieldStyle]
        
        let endTextFieldTextHeight: CGFloat = endText.boundingRect(with: CGSize(width: endTextFieldRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: endTextFieldFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: endTextFieldRect)
        endText.draw(in: CGRect(x: endTextFieldRect.minX, y: endTextFieldRect.minY + (endTextFieldRect.height - endTextFieldTextHeight) / 2, width: endTextFieldRect.width, height: endTextFieldTextHeight), withAttributes: endTextFieldFontAttributes)
        context.restoreGState()
        
        context.restoreGState()
        
        
        
        context.restoreGState()
        
        
        //// startFieldGroup
        context.saveGState()
        context.translateBy(x: 45, y: 46.5)
        context.rotate(by: -(startAngle - 360) * CGFloat.pi/180)
        
        
        
        //// startTextField Drawing
        context.saveGState()
        context.translateBy(x: 43.96, y: -7.06)
        context.rotate(by: -startFieldRotation * CGFloat.pi/180)
        
        let startTextFieldRect = CGRect(x: -8.17, y: -3.59, width: 16.33, height: 7)
        let startTextFieldStyle = NSMutableParagraphStyle()
        startTextFieldStyle.alignment = .center
        let startTextFieldFontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 5), NSAttributedStringKey.foregroundColor: startEndTextColor, NSAttributedStringKey.paragraphStyle: startTextFieldStyle]
        
        let startTextFieldTextHeight: CGFloat = startText.boundingRect(with: CGSize(width: startTextFieldRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: startTextFieldFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: startTextFieldRect)
        startText.draw(in: CGRect(x: startTextFieldRect.minX, y: startTextFieldRect.minY + (startTextFieldRect.height - startTextFieldTextHeight) / 2, width: startTextFieldRect.width, height: startTextFieldTextHeight), withAttributes: startTextFieldFontAttributes)
        context.restoreGState()
        
        context.restoreGState()
        
        
        
        context.restoreGState()
        
        
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 16.5, y: 17.5, width: 56, height: 56))
        context.saveGState()
        ovalPath.addClip()
        context.drawLinearGradient(gradient, start: CGPoint(x: 44.5, y: 17.5), end: CGPoint(x: 44.5, y: 73.5), options: [])
        context.restoreGState()
        
        
        //// Oval 2 Drawing
        let oval2Rect = CGRect(x: 19.5, y: 21, width: 50, height: 49)
        let oval2Path = UIBezierPath(ovalIn: oval2Rect)
        innerStrokeColor.setStroke()
        oval2Path.lineWidth = 1
        oval2Path.stroke()
        let oval2Style = NSMutableParagraphStyle()
        oval2Style.alignment = .center
        let oval2FontAttributes = [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue", size: 8)!, NSAttributedStringKey.foregroundColor: messageColor, NSAttributedStringKey.paragraphStyle: oval2Style]
        
        let oval2TextHeight: CGFloat = indicatorMessage.boundingRect(with: CGSize(width: oval2Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: oval2FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: oval2Rect)
        indicatorMessage.draw(in: CGRect(x: oval2Rect.minX, y: oval2Rect.minY + (oval2Rect.height - oval2TextHeight) / 2, width: oval2Rect.width, height: oval2TextHeight), withAttributes: oval2FontAttributes)
        context.restoreGState()
        
        
        //// startThumb Drawing
        context.saveGState()
        context.translateBy(x: 45, y: 46)
        context.rotate(by: -selectionStartAngle * CGFloat.pi/180)
        
        let startThumbPath = UIBezierPath(ovalIn: CGRect(x: 36.3, y: -4.13, width: 8, height: 8))
        thumbColor.setFill()
        startThumbPath.fill()
        
        context.restoreGState()
        
        
        //// endThumb Drawing
        context.saveGState()
        context.translateBy(x: 45, y: 46)
        context.rotate(by: -selectionEndAngle * CGFloat.pi/180)
        
        let endThumbPath = UIBezierPath(ovalIn: CGRect(x: 36.3, y: -4.13, width: 8, height: 8))
        thumbColor.setFill()
        endThumbPath.fill()
        
        context.restoreGState()
        
        
        if (isBarVisible) {
            //// selectionBar Drawing
            let selectionBarRect = CGRect(x: 4.5, y: 5.5, width: 81, height: 81)
            let selectionBarPath = UIBezierPath()
            selectionBarPath.addArc(withCenter: CGPoint(x: selectionBarRect.midX, y: selectionBarRect.midY), radius: selectionBarRect.width / 2, startAngle: -selectionStartAngle * CGFloat.pi/180, endAngle: -selectionEndAngle * CGFloat.pi/180, clockwise: true)
            
            thumbColor.setStroke()
            selectionBarPath.lineWidth = strokeWidth
            selectionBarPath.lineCapStyle = .round
            selectionBarPath.stroke()
        }
        
        
        if (isInvertedBarVisible) {
            //// invertedSelectionBar Drawing
            let invertedSelectionBarRect = CGRect(x: 4.5, y: 5.5, width: 81, height: 81)
            let invertedSelectionBarPath = UIBezierPath()
            invertedSelectionBarPath.addArc(withCenter: CGPoint(x: invertedSelectionBarRect.midX, y: invertedSelectionBarRect.midY), radius: invertedSelectionBarRect.width / 2, startAngle: -selectionEndAngle * CGFloat.pi/180, endAngle: -selectionStartAngle * CGFloat.pi/180, clockwise: true)
            
            thumbColor.setStroke()
            invertedSelectionBarPath.lineWidth = strokeWidth
            invertedSelectionBarPath.lineCapStyle = .round
            invertedSelectionBarPath.stroke()
        }
        
        context.restoreGState()
        
    }
    
    
    
    
    @objc public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.
        
        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }
            
            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)
            
            switch self {
            case .aspectFit:
                scales.width = min(scales.width, scales.height)
                scales.height = scales.width
            case .aspectFill:
                scales.width = max(scales.width, scales.height)
                scales.height = scales.width
            case .stretch:
                break
            case .center:
                scales.width = 1
                scales.height = 1
            }
            
            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}

