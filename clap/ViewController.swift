//
//  ViewController.swift
//  clap
//
//  Created by hmlab book pro on 2016/02/12.
//  Copyright © 2016年 hmlab book pro. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet var clapPickerView: UIPickerView!
    var audioPlayer:AVAudioPlayer!
    var soundCount:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //再生する音源のURLを生成
        let soundFilePath = NSBundle.mainBundle().pathForResource("clap", ofType: "wav")!
        let fileURL = NSURL(fileURLWithPath:Strimg(soundFilePath))
        
    //AVAudioPlayerのインスタント化
    do{
       audioPlayer = try AVAudioPlayer(countentsOfURL:fileURL)
    }catch{
       print("音楽ファイルを読み込めませんでした。")
    }
        
    clapPickerView.delegate = self
    clapPickerView.delegate = self
        
    


    }
        
    //いくつカテゴリーを持つか
        func numberOfCompanentsInPickerView(PickerView: UIPickerView)->Int{
            return 1
        }
        //いくつ選択しをつくるか
        func pickerView(pickerView: UIPickerView,numberOfRowsInCompanent companent:Int)->Int{
            return 10
        }
        //選択しに何を表示していくか１
        func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent companent:Int)->String{
            return"\(row+1)回"
        }
        func pickerView(pickerView: UIPickerView, didSelectRow row:Int, inComponent companent:Int){
            soundCount = row
        }
        @IBAction func playButton(){
            
         audioPlayer.numderOfLoops = soundCount
         audioPlayer.play()
         }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
     }
}