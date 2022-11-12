//
//  MoneyViewController.swift
//  gamble_luck
//
//  Created by 野中滉介 on 2022/07/22.
//

import UIKit
import AVFoundation


class MoneyViewController: UIViewController {
    @IBOutlet weak var MoneyLabel: UILabel!
    
    var boat_m: [String] = []
    
    var MoneyArray = ["100円", "200円", "300円"]
    var Money = ""
    var boat_type = 0
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        if let soundURL = Bundle.main.url(forResource: "money", withExtension: "mp3") {
            
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                player?.play()
            } catch {
                print("error")
            }
        }
        
        Money = MoneyArray[Int.random(in: 0..<3)]
        
        MoneyLabel.text = Money
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.player?.stop()
            self.performSegue(withIdentifier: "toResultVC", sender: nil)
            
        }

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let ResultVC = segue.destination as! ResultViewController
        ResultVC.BoatResult = boat_m
        ResultVC.MoneyResult = Money
        ResultVC.Boat_Type = boat_type
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
