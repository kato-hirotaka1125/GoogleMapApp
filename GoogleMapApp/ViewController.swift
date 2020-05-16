import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController,GMSMapViewDelegate {

    var placesClient: GMSPlacesClient!
    var locationManager = CLLocationManager()

    // Add a pair of UILabels in Interface Builder, and connect the outlets to these variables.
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        locationManager.requestAlwaysAuthorization()
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
//        self.view.addSubview(mapView)

        placesClient = GMSPlacesClient.shared()

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
  }
    // Add a UIButton in Interface Builder, and connect the action to this function.
    @IBAction func getCurrentPlace(_ sender: UIButton) {

      placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
        if let error = error {
          print("Current Place error: \(error.localizedDescription)")
          return
        }

        self.nameLabel.text = "No current place"
        self.addressLabel.text = ""

        if let placeLikelihoodList = placeLikelihoodList {
          let place = placeLikelihoodList.likelihoods.first?.place
          if let place = place {
            self.nameLabel.text = place.name
            self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
              .joined(separator: "\n")
          }
        }
      })
    }



    override func loadView() {
        // マップに指定の緯度経度の場所を指定の倍率で表示するように指示
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 10.0)

        // GMSMapViewインスタンスを生成
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView

        // 追加箇所
        // markerはピンの場所
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }

}
