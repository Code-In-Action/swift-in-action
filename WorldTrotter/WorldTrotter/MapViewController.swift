//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Go7hic on 2019/8/27.
//  Copyright © 2019 Go7hic. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView
    override func loadView() {
        mapView = MKMapView()
        view = mapView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view");
//        updateCelsiusLabel()
    }
    
}
