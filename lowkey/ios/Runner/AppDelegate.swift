import UIKit
import Flutter
import Firebase
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    FirebaseApp.configure()

    GMSServices.provideAPIKey("AIzaSyDCEA6sz4IqadOzYVKEcZB1ByPr6aQf1W8")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
