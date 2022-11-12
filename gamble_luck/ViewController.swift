//
//  ViewController.swift
//  gamble_luck
//
//  Created by 野中滉介 on 2022/07/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .red
        
        if let soundURL = Bundle.main.url(forResource: "warudakumi", withExtension: "mp3") {
            
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                player?.play()
            } catch {
                print("error")
            }
        }
        
    }
    
    @IBAction func musicstop(sender: UIButton){
        player?.stop()
    }


}

