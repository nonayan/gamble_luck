//
//  SetBoatViewController.swift
//  gamble_luck
//
//  Created by 野中滉介 on 2022/07/22.
//

import UIKit
import AVFoundation

class SetBoatViewController: UIViewController {
    
    var player: AVAudioPlayer?
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        if let soundURL = Bundle.main.url(forResource: "warudakumi", withExtension: "mp3") {
            
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                player?.play()
            } catch {
                print("error")
            }
        }

        // Do any additional setup after loading the view.
    }
    @IBAction func tansyou(sender: UIButton){
        player?.stop()
        count = 1
        performSegue(withIdentifier: "toResultVC", sender: nil)
    }
    @IBAction func fukusyou(sender: UIButton){
        player?.stop()
        count = 2
        performSegue(withIdentifier: "toResultVC", sender: nil)
    }
    @IBAction func rentan(sender: UIButton){
        player?.stop()
        count = 3
        performSegue(withIdentifier: "toResultVC", sender: nil)
    }
    @IBAction func renpuku(sender: UIButton){
        player?.stop()
        count = 4
        performSegue(withIdentifier: "toResultVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let BoatViewVC = segue.destination as! Result_BoatViewController
        BoatViewVC.Boattype = count
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
