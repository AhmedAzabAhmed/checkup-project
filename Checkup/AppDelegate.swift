//
//  AppDelegate.swift
//  Checkup
//
//  Created by Hassan Khamis on 4/8/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import GoogleSignIn
import RealmSwift
import MOLH
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,MOLHResetable{
 
 
    
   

var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
//      let navigationBar = UINavigationBar.appearance()
//        let gradient = CAGradientLayer()
//        var bounds = navigationBar.bounds
//        navigationBar.bounds.size.height += UIApplication.shared.statusBarFrame.size.height
//        navigationBar.gradient.frame = bounds
//        navigationBar.gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
//        navigationBar.gradient.startPoint = CGPoint(x: 0, y: 0)
//        navigationBar.gradient.endPoint = CGPoint(x: 1, y: 0)
        
        MOLH.shared.activate(true)
         reset()
        return true
    }
 
    
    func reset() {
                    if let rootViewController: UIWindow = ((UIApplication.shared.delegate?.window)!)
                    {
                        let story = UIStoryboard(name: "Home", bundle: nil)
                                           rootViewController.rootViewController = story.instantiateViewController(withIdentifier: "tabBarSvc")
        }
                   
     }
     
    
//    func reset() {
//           let rootViewController: UIWindow = ((UIApplication.shared.delegate?.window)!)!
//           let story = UIStoryboard(name: "Home", bundle: nil)
//           rootViewController.rootViewController = story.instantiateViewController(withIdentifier: "tabBarSvc")
//       }

    
                      ////  My Custom Function Mahmoud ///////
    //////**************** Siign In With Google **************** //
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
////      // ...
////      if let error = error {
////        // ...
////        return
////      }
////
////          print("The User Signed In Successfullt With Google ")
////
////          guard  ((user.profile?.email) != nil)  else {
////              return
////          }
////          print("The User Email : \( user.profile.email ?? "No Email")")
////      guard let authentication = user.authentication else { return }
////      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
////                                                        accessToken: authentication.accessToken)
////      // ...
//        if let error = error {
//        print(error.localizedDescription)
//        return
//        }
//        guard let auth = user.authentication else { return }
//        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
//        Auth.auth().signIn(with: credentials) { (authResult, error) in
//        if let error = error {
//        print(error.localizedDescription)
//        } else {
//        print("Login Successful.")
//            	//dismiss(animated: true, completion: nil)
//
//        //This is where you should add the functionality of successful login
//        //i.e. dismissing this view or push the home view controller etc
//        }
//        
//        
//        }}
//
//    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
//        // Perform any operations when the user disconnects from app here.
//        // ...
//    }
//    
//    
//    
// 
//       
//    @available(iOS 9.0, *)
//    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
//      -> Bool {
//      return GIDSignIn.sharedInstance().handle(url)
//    }
//    
//    //For your app to run on iOS 8 and older, also implement the deprecated
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//        return GIDSignIn.sharedInstance().handle(url)
//    }
//    
// 
     @available(iOS 9.0, *)
           func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
             -> Bool {
             return GIDSignIn.sharedInstance().handle(url)
           }
           
           //For your app to run on iOS 8 and older, also implement the deprecated
           func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
               return GIDSignIn.sharedInstance().handle(url)
           }
           
     ///************** end of custom functions ************
    // MARK: UISceneSession Lifecycle
@available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
@available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack
@available(iOS 13.0, *)    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
  let container = NSPersistentCloudKitContainer(name: "Checkup")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
  @available(iOS 13.0, *)
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

