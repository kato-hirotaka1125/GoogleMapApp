import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController,GMSMapViewDelegate {
    
    var placesClient: GMSPlacesClient!
    var locationManager = CLLocationManager()
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!
    var placeName: String = ""
    
    // Add a pair of UILabels in Interface Builder, and connect the outlets to these variables.
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        locationManager.requestAlwaysAuthorization()
        placesClient = GMSPlacesClient.shared()
    }
    // Add a UIButton in Interface Builder, and connect the action to this function.
    
    @IBAction func getCurrentPlace(_ sender: UIButton) {
        // 位置情報を取得して画面に表示
    }
    
    @IBAction func showMap(_ sender: UIButton) {
        // Map画面に遷移する
    }
}
