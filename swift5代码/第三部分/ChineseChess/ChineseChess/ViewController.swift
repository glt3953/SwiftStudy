//
//  ViewController.swift
//  ChineseChess
//
//  Created by 珲少 on 2021/2/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startGame: UIButton!
    
    @IBOutlet weak var musicButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //读取用户音频设置状态
        if UserInfoManager.getAudioState() {
            musicButton.setTitle("音乐:开", for: .normal)
            //进行音频播放
            MusicEngine.sharedInstance.playBackgroundMusic()
        }else{
            musicButton.setTitle("音乐:关", for: .normal)
            //停止音频播放
            MusicEngine.sharedInstance.stopBackgroundMusic()
        }
    }
    
    @IBAction func startGameClick(_ sender: Any) {
        let gameController = GameViewController()
        gameController.modalPresentationStyle = .overFullScreen
        self.present(gameController, animated: true, completion: nil)
    }
    @IBAction func musicButtonClick(_ sender: Any) {
        if UserInfoManager.getAudioState() {
            musicButton.setTitle("音乐:关", for: .normal)
            UserInfoManager.setAudioState(isOn:false)
            MusicEngine.sharedInstance.stopBackgroundMusic()
        }else{
            musicButton.setTitle("音乐:开", for: .normal)
            UserInfoManager.setAudioState(isOn:true)
            MusicEngine.sharedInstance.playBackgroundMusic()
        }
    }
}

