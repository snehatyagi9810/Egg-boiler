//
//  ViewController.swift
//  Egg boiler
//
//  Created by Sneh Tyagi on 13/07/23.
//
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player : AVAudioPlayer!
    

    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft":5 , "Medium": 7 , "Hard": 12]
    
   
   var timer = Timer()
    
    var totalTime = 0
    var secondPassed = 0
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        playsound(alarmSound: "sound")
        timer.invalidate()
        
        let hardness = sender.currentTitle!
    
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        titleLable.text = hardness
        
        
        
        timer =
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
@objc func updateTimer() {
        if secondPassed < totalTime {
            secondPassed += 1
            progressBar.progress = Float (secondPassed) / Float (totalTime)
            
            
          
        } else{
            timer.invalidate()
            titleLable.text = "Done"
        }
    }
    func playsound (alarmSound: String) {
        print(alarmSound)
        let url = Bundle.main.url(forResource:alarmSound, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    
    }

}
