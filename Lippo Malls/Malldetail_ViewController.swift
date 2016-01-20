//
//  Malldetail_ViewController.swift
//  Lippo Malls
//
//  Created by Ade Mahendra on 3/2/15.
//  Copyright (c) 2015 Ade Mahendra. All rights reserved.
//

import UIKit
import Alamofire

class Malldetail_ViewController: UIViewController {

    @IBOutlet weak var malltitleLabel: UILabel!
    @IBOutlet weak var promoImage1: UIImageView!
    
    var titlename = ""
    var imageCache = [String : UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false;
        let navBackgroundImage = UIImage(named: "navbarbg.jpg")
        self.navigationController?.navigationBar.setBackgroundImage(navBackgroundImage,
            forBarMetrics: .Default)

        

        malltitleLabel.text = self.titlename
        // Do any additional setup after loading the view.
        println(apiurl+"v4/event/home")
        Alamofire.request(.GET, apiurl+"v4/event/home")
            .authenticate(user: xhrusername, password: xhrpassword)
            .responseJSON { (_, _, jsonObject, _) in
                println(jsonObject)
                let json = JSON(jsonObject!)
//                let xhrdata = json["result"]["data"]
//                println(xhrdata[0]["picture"].stringValue)
                
//                let url: NSURL = NSURL(string: xhrdata[0]["picture"].stringValue)!;
//                var err: NSError?
//                var imageData: NSData = NSData(contentsOfURL: url)!
//                self.promoImage1.image = UIImage(data: imageData)
//                println(xhrdata.count)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
