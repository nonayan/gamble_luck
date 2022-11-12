//
//  ResultViewController.swift
//  gamble_luck
//
//  Created by 野中滉介 on 2022/07/22.
//

import UIKit
import AVFoundation

class Result_BoatViewController: UIViewController {
    
    @IBOutlet weak var BoatLabel: UILabel!
    @IBOutlet weak var Boatname: UILabel!
    
    var Boattype = 0
    
  
    var boatArray: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"]
    var boatName: [String] = ["ガイアフォース", "シェルビーズアイ", "プラダリア", "ボルドグフーシュ", "ヤマニンゼスト", "ビーアストニッシド", "アスクワイルドモア", "マイネルトルファン", "シホノスペランツァ", "セイウンハーデス", "ドゥラドーレス", "ヴェローナシチー", "ディナースタ", "アスクビクターモア", "ポッドボレット", "フェーングロッテン", "ジャスティンパレス", "セレシオン"]
    
    var boat_result: [String]  = ["", "", ""]
    
    var A = 0, B = 0, C = 0
    
    var baby: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        if let soundURL = Bundle.main.url(forResource: "baby", withExtension: "mp3") {
            
            do {
                self.baby = try AVAudioPlayer(contentsOf: soundURL)
                self.baby?.play()
                
            } catch {
                print("error")
            }
        }
        

        while (boat_result[0] == boat_result[1]) || (boat_result[1] == boat_result[2]) || (boat_result[0] == boat_result[2]) {
            
            boat_result[0] = boatArray[Int.random(in: 0..<18)]
            boat_result[1] = boatArray[Int.random(in: 0..<18)]
            boat_result[2] = boatArray[Int.random(in: 0..<18)]
                       
            }
        
        BoatLabel.text = boat_result[0]
        
        if let intA = (Int(boat_result[0])) {
            A = intA - 1
        } else {
            print("変換無理")
        }
        
        if let intB = (Int(boat_result[1])) {
            B = intB - 1
        } else {
            print("変換無理")
        }
        
        if let intC = (Int(boat_result[2])) {
            C = intC - 1
        } else {
            print("変換無理")
        }
        
        Boatname.text = boatName[A]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            
            //ここに処理
            self.BoatLabel.text = self.boat_result[1]
            self.Boatname.text = self.boatName[self.B]
            
            if let soundURL = Bundle.main.url(forResource: "baby", withExtension: "mp3") {
                
                do {
                    self.baby = try AVAudioPlayer(contentsOf: soundURL)
                    self.baby?.play()
                    
                } catch {
                    print("error")
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [self] in
                
                if let soundURL = Bundle.main.url(forResource: "baby", withExtension: "mp3") {
                    
                    do {
                        self.baby = try AVAudioPlayer(contentsOf: soundURL)
                        self.baby?.play()
                        
                    } catch {
                        print("error")
                    }
                }
                
                self.BoatLabel.text = self.boat_result[2]
                self.Boatname.text = self.boatName[self.C]
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    
                    self.performSegue(withIdentifier: "toMoneyVC", sender: nil)
                    
                }
                
            }
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let MoneyVC = segue.destination as! MoneyViewController
        MoneyVC.boat_m = boat_result
        MoneyVC.boat_type = Boattype
        
    }
    
        
        
}
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
