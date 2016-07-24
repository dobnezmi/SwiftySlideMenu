//
//  SwiftySlideMenuDataSource.swift
//  SwiftySlideMenu
//
//  Created by Suzuki Shingo on 2016/07/11.
//  Copyright © 2016年 Suzuki Shingo All rights reserved.


import UIKit

// アニメーション開始方向(未実装)
public enum SwiftySlideDirection {
    case TopToBottom
    case BottomToTop
}

public protocol SwiftySlideMenuDataSource {
    func numberOfSwiftySlideMenu() -> Int
    func swiftySlideMenu(menu: SwiftySlideMenu, colorForIndex: Int) -> UIColor
    func swiftySlideMenu(menu: SwiftySlideMenu, viewForIndex: Int) -> UIView
    func swiftySlideMenu(menu: SwiftySlideMenu, didSelectRowAtIndex: Int)
    func swiftySlideMenu(menu: SwiftySlideMenu, heightForIndex: Int) -> CGFloat
}
