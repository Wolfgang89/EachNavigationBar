//
//  UINavigationController+Configuration.swift
//  EachNavigationBar
//
//  Created by Pircate(gao497868860@gmail.com) on 2018/6/26.
//  Copyright © 2018年 Pircate. All rights reserved.
//

import UIKit
import ObjectiveC

public class Configuration: NSObject {
    
    @objc public var isEnabled = false
    
    @objc public var isHidden = false
    
    @objc public var alpha: CGFloat = 1
    
    @objc public var barTintColor: UIColor?
    
    @objc public var tintColor: UIColor?
    
    @objc public var shadowImage: UIImage?
    
    // Hides shadow image.
    @objc public var isShadowHidden: Bool = false
    
    @objc public var titleTextAttributes: [NSAttributedString.Key : Any]?
    
    @objc public var isTranslucent: Bool = true
    
    @objc public var barStyle: UIBarStyle = .default
    
    @objc public var statusBarStyle: UIStatusBarStyle = .default
    
    /// Additional height for the navigation bar.
    @objc public var additionalHeight: CGFloat = 0
    
    /// Bar button item to use for the back button in the child navigation item.
    @objc public var backBarButtonItem: BackBarButtonItem = .none
    
    @available(iOS 11.0, *)
    /// Padding of navigation bar content view.
    @objc public lazy var layoutPaddings: UIEdgeInsets = {
        Const.NavigationBar.layoutPaddings
    }()
    
    @objc public var shadow: Shadow?
    
    var _largeTitleTextAttributes: [NSAttributedString.Key: Any]?
    
    var backgroundImage: UIImage?
    
    var barMetrics: UIBarMetrics = .default
    
    var barPosition: UIBarPosition = .any
}

extension Configuration {
    
    @available(iOS 11.0, *)
    @objc public var largeTitleTextAttributes: [NSAttributedString.Key: Any]? {
        get {
            return _largeTitleTextAttributes
        }
        set {
            _largeTitleTextAttributes = newValue
        }
    }
}

extension Configuration {
    
    @objc public func setBackgroundImage(
        _ backgroundImage: UIImage?,
        for barPosition: UIBarPosition = .any,
        barMetrics: UIBarMetrics = .default) {
        self.backgroundImage = backgroundImage
        self.barPosition = barPosition
        self.barMetrics = barMetrics
    }
}

public class Shadow: NSObject {
    @objc public private(set) var color: CGColor?
    @objc public private(set) var opacity: Float = 0
    @objc public private(set) var offset: CGSize = CGSize(width: 0, height: -3)
    @objc public private(set) var radius: CGFloat = 3
    @objc public private(set) var path: CGPath?
    
    @objc public static let none: Shadow = .init()
    
    @objc public convenience init(
        color: CGColor? = nil,
        opacity: Float = 0,
        offset: CGSize = CGSize(width: 0, height: -3),
        radius: CGFloat = 3,
        path: CGPath? = nil) {
        self.init()
        self.color = color
        self.opacity = opacity
        self.offset = offset
        self.radius = radius
        self.path = path
    }
}

extension Configuration {
    
    @available(swift, deprecated: 4.2, message: "Please use additionalHeight.")
    @objc public var extraHeight: CGFloat {
        get {
            return additionalHeight
        }
        set {
            additionalHeight = newValue
        }
    }
}
