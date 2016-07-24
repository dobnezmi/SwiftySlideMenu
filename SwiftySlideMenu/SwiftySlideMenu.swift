//
//  SwiftySlideMenu.swift
//  SwiftySlideMenu
//
//  Created by Suzuki Shingo on 2016/07/11.
//  Copyright © 2016年 Suzuki Shingo All rights reserved.


import UIKit

public class SwiftySlideMenu {
    private let ownerView: UIView
    private var menuViews = [UIView]()
    private(set) var isShow = false
    
    public var dataSource: SwiftySlideMenuDataSource?
    public var slideDirection: SwiftySlideDirection = .TopToBottom
    
    
    public init(ownerView: UIView) {
        self.ownerView = ownerView
    }
    
    // show menu
    public func show() {
        guard let source = dataSource else {
            return
        }
        guard isShow == false else {
            return
        }
        
        let frame = ownerView.frame
        var yPos  = frame.origin.y      // start position
        if slideDirection == .BottomToTop {
            yPos = 0
        }
        
        let numberOfRows = source.numberOfSwiftySlideMenu()
        for i in (0..<numberOfRows) {
            let height = source.swiftySlideMenu(self, heightForIndex: i)
            
            if slideDirection == .BottomToTop {
                yPos = frame.height - (CGFloat(i+1) * height)
            }
            
            let container = UIView(frame: CGRect(x: -frame.width, y: yPos, width: frame.width, height: height))
            let contentView = source.swiftySlideMenu(self, viewForIndex: i)
            addTouchEvent(i, view: container)
            container.addSubview(contentView)
            container.backgroundColor = source.swiftySlideMenu(self, colorForIndex: i)
            
            menuViews.append(container)
            ownerView.addSubview(container)
            startAnimation(i, view: container, callback: nil)

            yPos += height
        }
        isShow = true
    }
    
    // close menu
    public func close() {
        guard isShow else {
            return
        }
        
        var index = 0
        for menuView in menuViews.reverse() {
            startAnimation(index, view: menuView) {
                menuView.removeFromSuperview()
            }
            index += 1
        }
        
        isShow = false
    }
    
    private func addTouchEvent(indexAt: Int, view: UIView) {

        let _ = UITapGestureRecognizer(view: view).didEnd { [weak self] _ in
            view.alpha = 0.2
            UIView.animateWithDuration(0.5) {
                view.alpha = 1.0
            }
            if let s = self {
                s.dataSource?.swiftySlideMenu(s, didSelectRowAtIndex: indexAt)
                view.alpha = 1.0
            }            
        }
    }
    
    private func startAnimation(index: Int, view: UIView, callback: (()->())?) {

        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        
        if isShow {
            animation.fromValue = 0
            animation.toValue   = -1 * view.frame.width
        } else {
            animation.fromValue = 0
            animation.toValue   = view.frame.width
        }
        
        animation.fillMode  = kCAFillModeForwards
        animation.removedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.beginTime = CACurrentMediaTime() + Double(index) * 0.2
        animation.duration  = 0.5

        CATransaction.begin()
        CATransaction.setCompletionBlock {
            view.layer.removeAllAnimations()
            view.frame = CGRectOffset(view.frame, view.frame.width, 0)
            callback?()
        }
        view.layer.addAnimation(animation, forKey: "showslidemenu\(index)")
        CATransaction.commit()
    }
}
