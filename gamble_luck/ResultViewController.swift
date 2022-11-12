//
//  ResultViewController.swift
//  gamble_luck
//
//  Created by 野中滉介 on 2022/07/22.
//

import UIKit
import AVFoundation

class ResultViewController: UIViewController {
    @IBOutlet weak var Boat_Result: UILabel!
    @IBOutlet weak var Money_Result: UILabel!
    @IBOutlet weak var type: UILabel!
    
    var BoatResult: [String] = []
    var MoneyResult = ""
    var player: AVAudioPlayer?
    var Boat_Type = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red

        if let soundURL = Bundle.main.url(forResource: "ResultMusic", withExtension: "mp3") {
            
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                player?.play()
            } catch {
                print("error")
            }
        }
        
        if Boat_Type == 1{
            type.text = "単勝"
        }else if Boat_Type == 2{
            type.text = "複勝"
        }else if Boat_Type == 3{
            type.text = "三連単"
        }else if Boat_Type == 4{
            type.text = "三連複"
        }

        
        Boat_Result.text = "\(BoatResult[0])ー\(BoatResult[1])ー\(BoatResult[2])"
        Money_Result.text = MoneyResult
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toTopButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
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
