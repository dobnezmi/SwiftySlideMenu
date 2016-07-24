# SwiftySlideMenu
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/SwiftySlideMenu.svg)](https://img.shields.io/cocoapods/v/SwiftySlideMenu.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Slide animation menu written in Swift.
SwiftySlideMenu is using [SwiftyGestureRecognition](https://github.com/b3ll/SwiftyGestureRecognition).

![DEMO GIF](https://github.com/dobnezmi/SwiftySlideMenu/blob/master/slidedemo.gif)

# Installation
## Carthage
To integrate SwiftySlideMenu into your Xcode project using Carthage, specify it in your Cartfile:

    github "dobnezmi/SwiftySlideMenu"

Run `carthage update` to build the framework and drag the built SwiftySlideMenu.framework into your Xcode project.

## CocoaPods

    use_frameworks!

    target '<Your Target Name>' do
        pod 'SwiftySlideMenu'
    end

Then, run the following command:
    $ pod install

# Usage

```Swift
class YourViewController: UIViewController, SwiftySlideMenuDataSource  {
  var slideMenu: SwiftySlideMenu?

  override func viewDidLoad() {
        super.viewDidLoad()
        slideMenu = SwiftySlideMenu(ownerView: self.view)
        slideMenu?.dataSource = self
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
```

# License
MIT license. See the `LICENSE` file for details.
