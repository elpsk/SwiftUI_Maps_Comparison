//
//  GoogleMap.swift
//  MapsComparison
//
//  Created by Pasca Alberto, IT on 01/03/21.
//

import SwiftUI
import GoogleMaps

class GoogleMapCoordinator: NSObject, GMSMapViewDelegate {

    var parent: GoogleMap
    init(_ parent: GoogleMap) {
        self.parent = parent
    }

    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let callout = UIHostingController(rootView: EmptyView())
        callout.view.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
        callout.view.backgroundColor = UIColor.red
        return callout.view
    }

}


struct GoogleMap: UIViewRepresentable {

    @ObservedObject var locationManager = LocationManager()

    func makeUIView(context: Context) -> some GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 10, longitude: 10, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ mapView: UIViewType, context: Context) {
        mapView.animate(toLocation: CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude))
        setupMarkers(mapView)
    }

    func setupMarkers(_ mapView: GMSMapView) {
        let position = CLLocationCoordinate2D(latitude: 10, longitude: 10)
        let marker = GMSMarker(position: position)
        marker.title = "Hello World"
        marker.icon = UIImage(named: "pin-black")!
        marker.map = mapView
    }

    func makeCoordinator() -> GoogleMapCoordinator {
        GoogleMapCoordinator(self)
    }

}

struct GoogleMap_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMap()
    }
}
