//
//  Components
//
//  Created by bwk on Sun.07.Mar.17.
//  Copyright © 2017 Bar Down Software. All rights reserved.
//

//  Blah blah blah

import UIKit

protocol Reusable: class {}

extension Reusable where Self: UIView
{
    static var reuseIdentifier: String
    {
        return String(describing: self)
    }
}

extension UITableView
{
    func register<T: UITableViewCell>(_: T.Type) where T: Reusable
    {
        register(T.nib()!, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueCell<T: UITableViewCell>(reuseableCell : T.Type) -> T? where T: Reusable
    {
        return dequeueReusableCell(withIdentifier: reuseableCell.reuseIdentifier) as? T
    }
}
