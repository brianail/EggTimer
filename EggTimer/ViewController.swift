//
//  ViewController.swift
//  EggTimer
//
//  Created by Brian Ail on 04/03/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet var titleLabel: UILabel!
    
    var timer = Timer()
    var totalTime = 0
    var player: AVAudioPlayer!
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle! //Soft, Medium, Hard
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
          
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float (totalTime)
            print(Float(secondsPassed) / Float(totalTime))

        } else {
            
            timer.invalidate()
            titleLabel.text = "Finish!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    
}


