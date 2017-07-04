//
//  College.swift
//  College Profile Builder
//
//  Created by Alexandra Stavrakos on 7/3/17.
//  Copyright © 2017 Alexandra Stavrakos. All rights reserved.
//

import UIKit
import RealmSwift

class College: Object {
    dynamic var name = String()
    dynamic var location = String()
    dynamic var enrollment = Int()
    dynamic var image = Data()
    dynamic var website = String()
    
    convenience init(name: String, location: String, enrollment: Int, image: Data, website: String)
    {
        self.init()
        self.name = name
        self.location = location
        self.enrollment = enrollment
        self.image = image
        self.website = website
    }
}
