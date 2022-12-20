//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by Jamong on 2022/12/13.
//

import UIKit

// 델리게이트 설정
protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {
    
    // Text
    @IBOutlet weak var textField: UITextField!
    
    // Text Colors
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    
    // Background Colors
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    // 초기 세팅 값
    weak var delegate: LEDBoardSettingDelegate?
    var ledText: String?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    // 설정 값 초기화 방지 및 저장 기능
    private func configureView() {
        if let ledText = self.ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColorButton(color: self.backgroundColor)
    }
    
    // 글자 색상 버튼 눌림 기능
    @IBAction func tapTextColorButton(_ sender: UIButton) {
        if sender == self.yellowButton {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.purpleButton {
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        } else if sender == self.greenButton {
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
    }
    
    // 배경 색상 버튼 눌림 기능
    @IBAction func tpaBackgroundColorButton(_ sender: UIButton) {
        if sender == self.blackButton {
            self.changeBackgroundColorButton(color: .black)
            self.backgroundColor = .black
        } else if sender == self.blueButton {
            self.changeBackgroundColorButton(color: .blue)
            self.backgroundColor = .blue
        } else if sender == self.orangeButton {
            self.changeBackgroundColorButton(color: .orange)
            self.backgroundColor = .orange
        }
    }
    
    // 저장 버튼 기능(저장 및 색상 보내기)
    @IBAction func tapSaveButton(_ sender: UIButton) {
        self.delegate?.changedSetting(
            text: textField.text,
            textColor: textColor,
            backgroundColor: backgroundColor
        )
        self.navigationController?.popViewController(animated: true)
    }
    
    // 글자 색상 버튼 눌렀을 떄 삼항연산자 처리
    private func changeTextColor(color: UIColor) {
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    // 배경 색상 버튼 눌렀을 때 삼항연산자 처리
    private func changeBackgroundColorButton(color: UIColor){
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }

}
