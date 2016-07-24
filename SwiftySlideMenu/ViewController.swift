//
//  ViewController.swift
//  SwiftySlideMenu
//
//  Created by Suzuki Shingo on 2016/07/11.
//  Copyright © 2016年 Suzuki Shingo All rights reserved.


import UIKit

class ViewController: UIViewController, SwiftySlideMenuDataSource {

    var slideMenu: SwiftySlideMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slideMenu = SwiftySlideMenu(ownerView: self.view)
        slideMenu.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showBottomToTop(sender: AnyObject) {
        slideMenu.slideDirection = .BottomToTop
        slideMenu.show()
    }
    
    @IBAction func showTopToBottom(sender: AnyObject) {
        slideMenu.slideDirection = .TopToBottom
        slideMenu.show()
    }
    

    // SwiftySlideMenuDataSource
    func numberOfSwiftySlideMenu() -> Int {
        return 5
    }
    
    func swiftySlideMenu(menu: SwiftySlideMenu, colorForIndex: Int) -> UIColor {
        let alpha: CGFloat = (255 - (CGFloat(colorForIndex) * 10)) / 255
        return UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
    }
    
    func swiftySlideMenu(menu: SwiftySlideMenu, viewForIndex: Int) -> UIView {
        let view = UIView(frame: CGRect(x: 20, y: 10, width: 300, height:  60))
        let label = UILabel()
        label.text = "SAMPLE \(viewForIndex)"
        label.sizeToFit()
        label.textColor = UIColor.whiteColor()
        view.addSubview(label)
        view.backgroundColor = UIColor.clearColor()
        return view
    }

    func swiftySlideMenu(menu: SwiftySlideMenu, didSelectRowAtIndex: Int) {
        slideMenu.close()
    }
    
    func swiftySlideMenu(menu: SwiftySlideMenu, heightForIndex: Int) -> CGFloat {
        return 80
    }

}

