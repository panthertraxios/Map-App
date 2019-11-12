//
//  Building.swift
//  Campus Map
//
//  Created by Kezman, Alexandra A on 10/22/19.
//  Copyright © 2019 Alexandra Kezman. All rights reserved.
//

import Foundation
import MapKit

//create builing object
class Buildings: NSObject, MKAnnotation {
    let title: String?
    let code: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, code: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.code = code
        self.coordinate = coordinate
        
        super.init()
    }

    
    //returns building code as subtitle
    var subtitle: String? {
        return code;
    }
    
}
//extension Buildings: MKAnnotation { }
