//
//  AppleMap.swift
//  MapsComparison
//
//  Created by Pasca Alberto, IT on 01/03/21.
//

import SwiftUI
import MapKit

class AppleMapCoordinator: NSObject, MKMapViewDelegate {

    var parent: AppleMap
    init(_ parent: AppleMap) {
        self.parent = parent
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil } // skip gps

        let annotationIdentifier = "pin"

        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        } else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }

        if let annotationView = annotationView {
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "pin-black")
        }

        return annotationView
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let callout = UIHostingController(rootView: EmptyView())
        callout.view.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
        callout.view.backgroundColor = UIColor.red
        view.addSubview(callout.view)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        view.removeFromSuperview()
    }

}

struct AppleMap: UIViewRepresentable {
    
    @ObservedObject var locationManager = LocationManager()

    func makeUIView(context: Context) -> some MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ mapView: UIViewType, context: Context) {
        mapView.setRegion(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude),
                latitudinalMeters: 500000,
                longitudinalMeters: 500000),
            animated: true
        )
        setupMarkers(mapView)
    }

    func setupMarkers(_ mapView: MKMapView) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 10, longitude: 10)
        annotation.title = "My Location"
        annotation.subtitle = "Visit us soon"
        mapView.addAnnotation(annotation)
    }

    func makeCoordinator() -> AppleMapCoordinator {
        return AppleMapCoordinator(self)
    }

}

struct AppleMap_Previews: PreviewProvider {
    static var previews: some View {
        AppleMap()
    }
}
