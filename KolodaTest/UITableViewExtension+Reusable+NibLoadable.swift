//
//  UITableViewExtension+Reusable+NibLoadable.swift
//
//  Created by Javier Loucim on 10/15/16.
//  Copyright © 2016 Javier Loucim. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: Reusable, T: NibLoadable {
        
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
}
