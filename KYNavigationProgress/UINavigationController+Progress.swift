//
//  UINavigationController+Progress.swift
//  KYNavigationProgress
//
//  Created by 山口　恭兵 on 2015/12/29.
//  Copyright © 2015年 kyo__hei. All rights reserved.
//

import UIKit

private let constraintIdentifier = "progressHeightConstraint"

public extension UINavigationController {
    
    /* ====================================================================== */
    // MARK: - Properties
    /* ====================================================================== */
    
    /**
     Default is 2.0
    */
    public var progressHeight: CGFloat {
        get {
            return navigationBar.constraints
                .filter{ $0.identifier == constraintIdentifier }
                .first?.constant ?? 0.2
        }
        set {
            navigationBar.constraints
                .filter{ $0.identifier == constraintIdentifier }
                .first?.constant = newValue
        }
    }
    
    /**
     The color shown for the portion of the progress bar that is not filled.
     default is clear color.
    */
    public var trackTintColor: UIColor? {
        get { return progressView.backgroundColor }
        set { progressView.backgroundColor = newValue }
    }
    
    /**
     The color shown for the portion of the progress bar that is filled.
     default is (r: 0, g: 122, b: 225, a: 255.
    */
    public var progressTintColor: UIColor? {
        get { return progressView.bar.backgroundColor }
        set { progressView.bar.backgroundColor = newValue }
    }
    
    /**
     The current progress is represented by a floating-point value between 0.0 and 1.0,
     inclusive, where 1.0 indicates the completion of the task. The default value is 0.0.
    */
    public var progress: Float {
        get { return progressView.progress }
        set { progressView.progress = newValue }
    }
    
    
    private var progressView: ProgressView {
        for subview in navigationBar.subviews {
            if let progressView = subview as? ProgressView {
                return progressView
            }
        }
        
        let defaultHeight = CGFloat(2)
        let frame = CGRect(
            x: 0,
            y: navigationBar.frame.height - defaultHeight,
            width: navigationBar.frame.width,
            height: defaultHeight
        )
        let progressView = ProgressView(frame: frame)
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        navigationBar.addSubview(progressView)
        
        let progressHeightConstraint = NSLayoutConstraint(
            item: progressView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: defaultHeight)
        progressHeightConstraint.identifier = constraintIdentifier
        
        navigationBar.addConstraint(progressHeightConstraint)
        navigationBar.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[progressView]-0-|",
            options: [],
            metrics: nil,
            views: ["progressView" : progressView]))
        navigationBar.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[progressView]-0-|",
            options: [],
            metrics: nil,
            views: ["progressView" : progressView]))
        
        return progressView
    }
    
    
    /* ====================================================================== */
    // MARK: - Public Method
    /* ====================================================================== */
    
    /**
    Adjusts the current progress shown by the receiver, optionally animating the change.
    
    - parameter progress: The new progress value.
    - parameter animated: true if the change should be animated, false if the change should happen immediately.
    */
    public func setProgress(progress: Float, animated: Bool) {
        progressView.bar.alpha = 1
        progressView.setProgress(progress, animated: animated)
    }
    
    /**
     While progress is changed to 1.0, the bar will fade out. After that, progress will be 0.0.
    */
    public func finishProgress() {
        progressView.bar.alpha = 1
        progressView.setProgress(1, animated: true)
        
        UIView.animateWithDuration(0.25,
            animations: {
                self.progressView.bar.alpha = 0
            }, completion: { finished in
                self.progressView.progress = 0
            }
        )
    }
    
    /**
     While progress is changed to 0.0, the bar will fade out.
    */
    public func cancelProgress() {
        progressView.setProgress(0, animated: true)
        
        UIView.animateWithDuration(0.25) {
            self.progressView.bar.alpha = 0
        }
    }
    
}
