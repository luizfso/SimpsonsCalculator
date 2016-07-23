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

    enum Operation: String{
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Equals = "="
        case Empty = "Empty"
        
    }
    
    @IBOutlet weak var outPutLbl: UILabel!
    
    var btnSounddoh: AVAudioPlayer!
    var btnSounddooh: AVAudioPlayer!
    
    var runnigNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let pathdoh = Bundle.main.pathForResource("doh1", ofType: "wav")
        let soundURLdoh = URL(fileURLWithPath: pathdoh!)
        
        try! btnSounddoh = AVAudioPlayer(contentsOf: soundURLdoh)
        
        let pathdooh = Bundle.main.pathForResource("doh3", ofType: "wav")
        let soundURLdooh = URL(fileURLWithPath: pathdooh!)
        
        try! btnSounddooh = AVAudioPlayer(contentsOf: soundURLdooh)
        
        outPutLbl.text = "0"
        
    }
    
    

    @IBAction func numberPressed(_ btn: UIButton!){
        
        playSounddoh()
        
        runnigNumber += "\(btn.tag)"
        
        outPutLbl.text = runnigNumber
        
    }
    
    @IBAction func onDividePressed(_ sender: AnyObject) {
        outPutLbl.text  = String(Operation.Divide)
        processOperation(Operation.Divide)
    
    }
    
    @IBAction func onMultiplyPressed(_ sender: AnyObject) {
        outPutLbl.text = String(Operation.Multiply)
        processOperation(Operation.Multiply)
    }
    
    
    @IBAction func onSubtractPressed(_ sender: AnyObject) {
        outPutLbl.text = String(Operation.Subtract)
        processOperation(Operation.Subtract)
    }
    
    
    @IBAction func onAddPressed(_ sender: AnyObject) {
        outPutLbl.text = String(Operation.Add)
        processOperation(Operation.Add)
    }
    
    
    @IBAction func onEqualPressed(_ sender: AnyObject) {
//        processOperation(Operation.Equals)
//        playSounddooh()
        processOperation(currentOperation)
    }
    
    
    
    func processOperation(_ op: Operation){
        playSounddooh()
        
        if currentOperation != Operation.Empty{
            //Run some Math
            
            if runnigNumber != "" {
                rightValStr = runnigNumber
                runnigNumber = ""
                
                if currentOperation == Operation.Multiply{
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide{
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract{
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Add{
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outPutLbl.text = result
            }
            
            currentOperation = op
            
            
        } else {
            //This is the first time an operator has been pressed
            leftValStr = runnigNumber
            runnigNumber = ""
            currentOperation = op
        }
        
    }
    
    
    func playSounddoh(){
        if  btnSounddoh.isPlaying{
            btnSounddoh.stop()
        }
        btnSounddoh.play()
    }
    
    func playSounddooh(){
    if  btnSounddooh.isPlaying{
    btnSounddooh.stop()
    }
    btnSounddooh.play()
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

