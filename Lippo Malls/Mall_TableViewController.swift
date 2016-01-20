//
//  Mall_TableViewController.swift
//  Lippo Malls
//
//  Created by Ade Mahendra on 3/2/15.
//  Copyright (c) 2015 Ade Mahendra. All rights reserved.
//

import UIKit



class Mall_TableViewController: UITableViewController {

    var malllist = [Malldata]()
    
    var imageCache = [String : UIImage]()
//    let maps = db["map"]
//    let id = Expression<Int>("id")
//    let mallname = Expression<String>("name")
//    let picture = Expression<String>("picture")
    
    var selected : NSIndexPath = NSIndexPath()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false;
        let navBackgroundImage = UIImage(named: "navbarbg.jpg")
        self.navigationController?.navigationBar.setBackgroundImage(navBackgroundImage,
            forBarMetrics: .Default)
        
        self.tableView.rowHeight = 60
//        for map in maps {
////            println("id: \(map[id]), name: \(map[name]), pict: \(map[picture])")
//            var pictureMall:String = "http://lippo.allega.co.id/images/icon_6.png"
//            println(pictureMall)
//            println("begin ")
////          
//            if map[picture] != nil {
//                
//            }
//            if(map[picture].isEmpty){
//                println("Empty Masuk")
//                pictureMall = "http://lippo.allega.co.id/images/icon_6.png"
//            } else {
//                println("Not Empty")
//                pictureMall = (map[picture])
//            }
//            println(pictureMall)
//            self.malllist.append(Malldata(id: (map[id]), name: (map[mallname]), address: "Sunset", picture: pictureMall))
//        }
     
        for row in db.prepare("SELECT id, name, street1, picture FROM map") {
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
            println("--> \(spicture)")
            self.malllist.append(Malldata(id: 1, name: sname, address: saddress, picture: spicture ))
            
            
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.malllist.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mallcell", forIndexPath: indexPath) as MallCell_TableViewCell
        
        cell.titleLabel.text = self.malllist[indexPath.row].name
        var urlstring = self.malllist[indexPath.row].picture
        
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
                        cell.mallIcon.image = image
                        
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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       // self.selected = indexPath
      //  println(self.selected.item)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    //    println(self.selected.item)
        let details = segue.destinationViewController as Malldetail_ViewController
        self.selected = self.tableView.indexPathForSelectedRow()!
        println(self.selected.item)
        println(self.malllist[self.selected.item])
        
        details.titlename = self.malllist[self.selected.item].name
        //self.performSegueWithIdentifier("gotoDetails", sender: self)
    }
    

}
