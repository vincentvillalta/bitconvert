//
//  ListCollectionContext+Extensions.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import IGListKit

extension ListCollectionContext {
    
    func dequeueReusableCell<T: AnyObject>(type: T.Type, for sectionController: ListSectionController, at index: Int) -> T {
        return dequeueReusableCell(of: type, for: sectionController, at: index) as! T
    }
}
