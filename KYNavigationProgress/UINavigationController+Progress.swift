//
//  UINavigationController+Progress.swift
//  KYNavigationProgress
//
//  Created by kyo__hei on 2015/12/29.
//  Copyright (c) 2015 kyo__hei. All rights reserved.
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
        get { return progressView.frame.height }
        set {
            progressView.frame.origin.y = navigationBar.frame.height - newValue
            progressView.frame.size.height = newValue
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
        
        navigationBar.addSubview(progressView)
        
        progressView.autoresizingMask = [
            .FlexibleWidth, .FlexibleTopMargin
        ]
        
        
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
