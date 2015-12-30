//
//  ProgressView.swift
//  KYNavigationProgress
//
//  Created by kyo__hei on 2015/12/29.
//  Copyright (c) 2015 kyo__hei. All rights reserved.
//

import UIKit

internal final class ProgressView: UIView {
    
    /* ====================================================================== */
    // MARK: - Properties
    /* ====================================================================== */
    
    internal var progress: Float = 0 {
        didSet {
            progress = min(1, progress)
            barWidthConstraint.constant = bounds.width * CGFloat(progress)
        }
    }
    
    internal let bar = UIView()
    
    private let defaultBarColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
    
    private let defaultTrackColor = UIColor.clearColor()
    
    private let barWidthConstraint: NSLayoutConstraint
    
    override var frame: CGRect {
        didSet {
            let tmpProgress = progress
            progress = tmpProgress
        }
    }
    
    
    /* ====================================================================== */
    // MARK: - initializer
    /* ====================================================================== */
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        barWidthConstraint = NSLayoutConstraint(
            item: bar,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: frame.width * CGFloat(progress))
        
        super.init(frame: frame)
        
        let leftConstraint = NSLayoutConstraint(
            item: bar,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1,
            constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(
            item: bar,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1,
            constant: 0)
        
        let topConstraint = NSLayoutConstraint(
            item: bar,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1,
            constant: 0)
        
        addSubview(bar)
        
        backgroundColor = defaultTrackColor
        
        bar.backgroundColor = defaultBarColor
        bar.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            barWidthConstraint,
            leftConstraint,
            topConstraint,
            bottomConstraint])
    }
    
    
    /* ====================================================================== */
    // MARK: - Notification
    /* ====================================================================== */
    
    func deviceDidRotate(notification: NSNotification) {
    }
    
    
    /* ====================================================================== */
    // MARK: - Method
    /* ====================================================================== */
    
    internal func setProgress(progress: Float, animated: Bool) {
        let duration: NSTimeInterval = animated ? 0.1 : 0
        
        self.progress = progress
        
        UIView.animateWithDuration(duration) {
            self.layoutIfNeeded()
        }
    }

}
