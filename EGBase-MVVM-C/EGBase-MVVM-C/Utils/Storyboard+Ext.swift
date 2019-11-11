//
//  Storyboard+Ext.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/6/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import Foundation
import UIKit

extension NSObject: ResponseType {}

extension NSObject: ResponseIdentifier {}

// MARK: - Response Type
protocol ResponseType {}

extension ResponseType {
    
    static var typeSelf: Self.Type {
        return Self.self
    }
    
    var typeSelf: Self.Type {
        return Self.self
    }
}

// MARK: - Response Identifier
protocol ResponseIdentifier {}

extension ResponseIdentifier {
    var identifier: String {
        return String(describing: type(of: self))
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController {

//    static func fromStoryboard(_ storyboardName: UIStoryboard.StoryboardName) -> UIViewController {
//        let identifier = String(describing: self)
//        return UIViewController.withIdentifier(identifier, storyboardName: storyboardName.rawValue)
//    }
//
//    static func withIdentifier(_ identifier: String, storyboardName: String) -> UIViewController {
//        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
//        return storyboard.instantiateViewController(withIdentifier: identifier)
//    }

//    static func initialViewControllerOf(_ storyboardName: String) -> UIViewController? {
//        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
//        return storyboard.instantiateInitialViewController()
//    }
}

// MARK: - Response UIViewController
protocol ResponseUIViewController {}


extension ResponseUIViewController where Self: UIViewController {
    static func fromNib() -> Self {
        return self.init(nibName: String(describing: self), bundle: nil)
    }
    
    static func fromStoryboard(_ storyboardIdentifier: StoryboardIdentifier, withIdentifier: String = Self.identifier) -> Self {
        guard let viewController = Self.fromStoryboard(self, storyboardIdentifier: storyboardIdentifier, withIdentifier: withIdentifier) else {
            fatalError("Couldn't find identifier \(withIdentifier) in storyboardName: \(storyboardIdentifier.rawValue)")
        }
        return viewController
    }
    
    private static func fromStoryboard<T: UIViewController>(_ type: T.Type, storyboardIdentifier: StoryboardIdentifier, withIdentifier: String?) -> T? {
        let storyboard = UIStoryboard(storyboardIdentifier: storyboardIdentifier, bundle: nil)
        return storyboard.instantiateViewController(type)
    }
}

extension UIViewController: ResponseUIViewController { }

extension UIStoryboard {

    convenience init(storyboardIdentifier: StoryboardIdentifier, bundle: Bundle? = nil) {
        self.init(name: storyboardIdentifier.rawValue, bundle: bundle)
    }
    
    class func storyboard(_ storyboardIdentifier: StoryboardIdentifier, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboardIdentifier.rawValue, bundle: bundle)
    }
    
    func instantiateViewController<T: UIViewController>(_ type: T.Type) -> T? {
        return instantiateViewController(withIdentifier: type.identifier) as? T
    }
}


