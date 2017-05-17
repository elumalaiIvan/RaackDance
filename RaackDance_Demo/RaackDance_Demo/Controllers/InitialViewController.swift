//
//  InitialViewController.swift
//  RaackDance_Demo
//
//  Created by Elumalai Ramalingam on 17/05/17.
//  Copyright © 2017 Elumalai Ramalingam. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    @IBOutlet weak var webViewBackground: UIWebView!

    @IBOutlet weak var BGImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTheBackground()

        // Do any additional setup after loading the view.
    }
    
    func parallaxEffectOnBackground() {
        let relativeMotionValue = 50
        let verticalMotionEffect : UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y",
                                                                                             type: .tiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -relativeMotionValue
        verticalMotionEffect.maximumRelativeValue = relativeMotionValue
        
        let horizontalMotionEffect : UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
                                                                                               type: .tiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -relativeMotionValue
        horizontalMotionEffect.maximumRelativeValue = relativeMotionValue
        
        let group : UIMotionEffectGroup = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        
        BGImageView.addMotionEffect(group)
        
    }
    
    func setUpTheBackground(){
        
        let filePath = Bundle.main.url(forResource: "rain", withExtension: "gif")
        let gif = try? Data(contentsOf: filePath!)
        
        webViewBackground.load(gif!, mimeType: "image/gif", textEncodingName: String(), baseURL:NSURL() as URL)
        webViewBackground.isUserInteractionEnabled = false;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
