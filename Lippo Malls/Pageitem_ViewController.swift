//
//  Pageitem_ViewController.swift
//  Lippo Malls
//
//  Created by Ade Mahendra on 3/4/15.
//  Copyright (c) 2015 Ade Mahendra. All rights reserved.
//

import UIKit

class Pageitem_ViewController: UIViewController {
    
    var itemIndex: Int = 0 // ***
    var mallList = [Malldata]()
    var cityname = ""
    
    var imageCache = [String : UIImage]()
    var selected : NSIndexPath = NSIndexPath()
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var mallTable: UITableView!
    
//    @IBOutlet weak var mallCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameLabel.text = cityname
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.mallList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("selectmallcell", forIndexPath: indexPath) as Selectmallcell_TableViewCell
        
//        println(self.mallList[indexPath.row].name)
//        println(self.mallList[indexPath.row].picture)

        cell.mallName.text = self.mallList[indexPath.row].name

        var urlstring = self.mallList[indexPath.row].picture
        
        var url: NSURL = NSURL(string: urlstring)!;
        var image = self.imageCache[urlstring]
        let request: NSURLRequest = NSURLRequest(URL: url)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse!,data: NSData!,error: NSError!) -> Void in
            if error == nil {
                image = UIImage(data: data)
                
                // Store the image in to our cache
                self.imageCache[urlstring] = image
                dispatch_async(dispatch_get_main_queue(), {
                    if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath) {
                        cell.mallicon.image = image
                        
                    }
                })
            }
            else {
                println("Error: \(error.localizedDescription)")
            }
        })
        
        
        
        
        
        // Configure the cell...
        
        return cell
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // self.selected = indexPath
        //  println(self.selected.item)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        //    println(self.selected.item)
        let details = segue.destinationViewController as Malldetail_ViewController
//        self.selected = self.tableView.indexPathForSelectedRow()!
//        println(self.selected.item)
//        println(self.mallList[self.selected.item])
        
//        details.titlename = self.mallList[self.selected.item].name
        //self.performSegueWithIdentifier("gotoDetails", sender: self)
    }

}
