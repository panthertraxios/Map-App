//
//  ViewController.swift
//  Campus Map
//
//  Created by Kezman, Alexandra A on 10/22/19.
//  Copyright © 2019 Alexandra Kezman. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var destinationField: UITextField!
    @IBOutlet weak var sourceField: UITextField!
    @IBAction func GoBtn(_ sender: UIButton) {
        view.endEditing(true)
        performSegue(withIdentifier: "map", sender: self)
    }
   
    override func loadView() {
        super.loadView()
    }
    var locationTuples: [(textField: UITextField?, mapItem: MKMapItem?)]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tracks user location
        let locationManager = CLLocationManager()
            
        if (mapView != nil) {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        }
        
            //plots center point of map
        let initialLocation = CLLocation(latitude:  26.61296, longitude: -80.087034)
        centerMapOnLocation(location: initialLocation)
        }
   
        
        
// //plotting humanities building
//        let HumanitiesBuilding = Buildings(title: "Humanities", code: "HU",
//                              coordinate: CLLocationCoordinate2D(latitude:26.611598, longitude: -80.088096))
////        mapView.addAnnotation(HumanitiesBuilding)
//
//        //plotting techology center
//        let TechBuilding = Buildings(title: "Technology", code: "TC",
//                                  coordinate: CLLocationCoordinate2D(latitude:26.612644, longitude: -80.087486))
////        mapView.addAnnotation(TechBuilding)
//
//
//        //plotting bookstore
//        let BookstoreBuilding = Buildings(title: "Bookstore", code: "BK",
//                                     coordinate: CLLocationCoordinate2D(latitude:26.612334, longitude: -80.085447))
////        mapView.addAnnotation(BookstoreBuilding)
//
//        //plotting cafeteria
//        let CafeteriaBuilding = Buildings(title: "Cafeteria", code: "CF",
//                                          coordinate: CLLocationCoordinate2D(latitude:26.612363, longitude: -80.084887))
////        mapView.addAnnotation(CafeteriaBuilding)
//
//
//        //plotting Registration/Admissions
//        let RegistrationBuilding = Buildings(title: "Registration/Admissions", code: "PG",
//                                          coordinate: CLLocationCoordinate2D(latitude:26.612688,longitude: -80.084977))
////        mapView.addAnnotation(RegistrationBuilding)
//
//        //plotting gym
//        let GymBuilding = Buildings(title: "Gymnasium", code: "PE",
//                                             coordinate: CLLocationCoordinate2D(latitude:26.611906, longitude: -80.084074))
////        mapView.addAnnotation(GymBuilding)
//
//
//        //plotting Natural Science
//        let NaturalScienceBuilding = Buildings(title: "Natural Science", code: "NS",
//                                    coordinate: CLLocationCoordinate2D(latitude:26.613854, longitude:   -80.088036))
////        mapView.addAnnotation(NaturalScienceBuilding)
//
    }
 
    //sets the radius from the center point to display
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 500
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func createRoute(mapView: MKMapView, route: String, location: CLLocation) {
    }
}
    
extension ViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(locations.last!,
        completionHandler:
            {(placemarks:[CLPlacemark]?, error:Error?) -> Void in
                if let placemarks = placemarks {
                let placemark = placemarks[0]
                self.locationTuples[0].mapItem = MKMapItem(placemark: MKPlacemark(coordinate: placemark.location!.coordinate, addressDictionary: placemark.addressDictionary as! [String:AnyObject]?))
            }
        })
    }
}





