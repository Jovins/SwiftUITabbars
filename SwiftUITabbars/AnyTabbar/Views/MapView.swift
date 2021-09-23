//
//  MapView.swift
//  SwiftUI-Tabbar
//
//  Created by Jovins on 2021/7/26.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var body: some View {
        NavigationView() {
            
            MapContentView()
                .navigationBarTitle(Text("位置"))
        }
    }
}

#if DEBUG
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
#endif

struct MapContentView: UIViewRepresentable {
    
    var locationManager = CLLocationManager()
    
    func setupManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            
            if let location = self.locationManager.location {
                let locValue:CLLocationCoordinate2D = location.coordinate
                let coordinate = CLLocationCoordinate2D(
                    latitude: locValue.latitude, longitude: locValue.longitude)
                let span = MKCoordinateSpan(latitudeDelta: 50.0, longitudeDelta: 62.0)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                view.setRegion(region, animated: true)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = "My Location"
                annotation.subtitle = "Welcome to my place"
                view.addAnnotation(annotation)
            }
        })
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        setupManager()
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }
}

