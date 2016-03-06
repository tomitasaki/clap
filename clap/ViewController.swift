//
//  ViewController.swift
//  clap
//
//  Created by hmlab book pro on 2016/02/12.
//  Copyright © 2016年 hmlab book pro. All rights reserved.
//



import UIKit
import AVFoundation

//class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    
    
    @IBOutlet var clapPickerView: UIPickerView!
    var audioPlayer:AVAudioPlayer!
    var soundCount:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //再生する音源のURLを生成
        let soundFilePath = NSBundle.mainBundle().pathForResource("clap", ofType: "wav")!
        let fileURL = NSURL(fileURLWithPath:String(soundFilePath))
        
        //AVAudioPlayerのインスタント化
        do{
            audioPlayer = try AVAudioPlayer(contentsOfURL:fileURL)
        }catch{
            print("音楽ファイルを読み込めませんでした。")
        }
        
        //    clapPickerView.delegate = self
        clapPickerView.delegate = self
        clapPickerView.dataSource = self
        
        
    }
    //表示列
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //表示個数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    //表示内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row+1)回"
    }
    
    //選択時
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        soundCount = row
    }
    /*
    
    //いくつカテゴリーを持つか
    func numberOfCompanentsInPickerView(pickerView: UIPickerView)->Int{
        return 1
        
    }
    //いくつ選択しをつくるか
    func pickerView(pickerView: UIPickerView,numberOfRowsInCompanent companent:Int)->Int{
        return 10
    }
    
    //選択しに何を表示していくか１
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return"\(row+1)回"
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row:Int, inComponent companent:Int){
        soundCount = row
    }*/
    @IBAction func playButton(){
        
        audioPlayer.numberOfLoops = soundCount
        audioPlayer.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}