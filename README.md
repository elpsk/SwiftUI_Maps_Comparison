## SwiftUI - Maps comparison example

Scope of the example is to use the `UIViewRepresentable` to render both maps, Apple Map `MKMapView` and Google Map `GMSMapView` in order to try the different implementation of Pin image, callout, interactions, animations, etc...

--

The code looks like this:

```
struct ContentView: View {    
    var body: some View {
        VStack {
            GoogleMap()
            AppleMap()
        }
    }
}
```

--

The app looks like this:  
![](/Users/pascaal001/Desktop/MapsComparison_GIT/demo.png)

--

In this example:  

- how to set **custom pin** image on both `MKMapView` and `GMSMapView`
- how to show a **custom callout** on both `MKMapView` and `GMSMapView`
- how to **center maps** using GPS on both `MKMapView` and `GMSMapView`
- **render Google Map** using Representable
- **render Apple Map** using Reprensentable


--

Feel free to add your extra example. *Pull requests are welcome*!

### NOTE: 
To use this example you need to configure the Google Maps Api Key in the `SceneDelegate.swift`.

```GMSServices.provideAPIKey(<#key#>)```

and to install the Google Map PODS: 

```pod install```
