//
//  ViewController.swift
//  RaackDance_Demo
//
//  Created by Elumalai Ramalingam on 16/05/17.
//  Copyright © 2017 Elumalai Ramalingam. All rights reserved.
//

import UIKit



class GalleryViewController: UIViewController {
    //let ref = FIRDatabase.database().reference(withPath: "grocery-items")
    @IBOutlet weak var carousalView: iCarousel!
    
    var galleryImageNames = ["1","2","3","4","5","6","7"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // let ref = FIRDatabase.database().reference(withPath: "Students")
        
        carousalView.type = .coverFlow
        carousalView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension GalleryViewController:iCarouselDataSource,iCarouselDelegate{
    
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        
        return galleryImageNames.count
    }
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var itemView: UIImageView
        if (view == nil)
        {
            itemView = UIImageView(frame:carousel.frame)
            itemView.contentMode = .scaleAspectFit
        }
        else
        {
            itemView = view as! UIImageView;
        }
        itemView.image = UIImage(named:"\(galleryImageNames[index]).jpg")
        return itemView
        
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        
        print("selected item is \(galleryImageNames[index])")
        
    }
    
}

