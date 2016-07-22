//
//  ViewController.swift
//  retro-calculator
//
//  Created by Luiz Fernando Santiago on 7/20/16.
//  Copyright © 2016 Luiz Fernando Santiago. All rights reserved.
//
// Added to Github

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var outPutLbl: UILabel!
    
    var btnSound: AVAudioPlayer!
    
    var runnigNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        try! btnSound = AVAudioPlayer(contentsOfURL: soundURL)
        
    }
    
    

    @IBAction func numberPressed(btn: UIButton!){
        
        btnSound.play()
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

