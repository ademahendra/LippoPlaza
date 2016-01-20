//
//  Selectmall_ViewController.swift
//  Lippo Malls
//
//  Created by Ade Mahendra on 3/4/15.
//  Copyright (c) 2015 Ade Mahendra. All rights reserved.
//

import UIKit

class Selectmall_ViewController: UIViewController, UIPageViewControllerDataSource {
    
    private var pageViewController: UIPageViewController?
    
    private var cityList = [Citydata]();

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false;
        let navBackgroundImage = UIImage(named: "navbarbg.jpg")
        self.navigationController?.navigationBar.setBackgroundImage(navBackgroundImage,
            forBarMetrics: .Default)
        
        for row in db.prepare("SELECT id, name FROM map_city") {

            var sname = ""
            if let name = row[1] as? String {
                sname = name
            }
            var rID = 0
            if let rid = row[0] as? Int {
                rID = rid
            }
//            println(rID)

            cityList.append(Citydata(id:rID, name:sname))
        }
        
        createPageViewController()
        setupPageControl()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createPageViewController() {
        
        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("PageController") as UIPageViewController
        pageController.dataSource = self
        
        if cityList.count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers: NSArray = [firstController]
            pageController.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
    }
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.grayColor()
        appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        appearance.backgroundColor = UIColor.darkGrayColor()
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as Pageitem_ViewController
        
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex-1)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as Pageitem_ViewController
        
        if itemController.itemIndex+1 < cityList.count {
            return getItemController(itemController.itemIndex+1)
        }
        
        return nil
    }
    
    private func getItemController(itemIndex: Int) -> Pageitem_ViewController? {
        
        if itemIndex < cityList.count {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("ItemController") as Pageitem_ViewController
            pageItemController.itemIndex = itemIndex
            pageItemController.mallList = [Malldata]()
            // add item to table
            for row in db.prepare("SELECT id, name, street1, picture FROM map where cityId = "+String(cityList[itemIndex].id)) {
                var sid = 0
                var sname = ""
                var saddress = ""
                var spicture = "http://lippo.allega.co.id/images/icon_6.png"
                if let name = row[1] as? String {
                    sname = name
                }
                if let address = row[2] as? String {
                    saddress = address
                }
                if let picture = row[3] as? String {
                    if !picture.isEmpty{
                        spicture = picture
                    }
                }

                pageItemController.mallList.append(Malldata(id: 1, name: sname, address: saddress, picture: spicture ))
            }
            pageItemController.cityname = cityList[itemIndex].name

            return pageItemController
        }
        
        return nil
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
