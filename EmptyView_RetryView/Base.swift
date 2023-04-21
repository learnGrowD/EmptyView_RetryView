//
//  Base.swift
//  EmptyView_RetryView
//
//  Created by 도학태 on 2023/04/21.
//

import Foundation
import UIKit


protocol Base {
    
}

extension Base {
    var rootViewController : UIViewController? {
        return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.rootViewController
    }
}


extension UIViewController : Base {
    
}

extension UIView : Base {
    
}
