# LEDBoardApp
LED 텍스트 보드 (iOS)앱

### Stroyboard Desgine (제약조건)

![](https://velog.velcdn.com/images/jamong-i/post/3293392c-ed68-4a54-9156-8ce162867d6c/image.png)

Navigation Controller를 추가하여 진입점으로 변경하였고 View Controller를 Root View Controller로 설정하였다.

#### View Controller

Label 아이템 추가 후 가운데 정렬
- Horizontally in Container
- Vertically in Container

Navigation Bar에 Bar Button Item을 추가하고 타이틀을 설정으로 변경했다.

Bar Button(설정)은 Action Seaguway로 새로운 View Controller에 show로 설정했다.

#### Setting View Controller

새로운 View Controller를 만들어서 Class를 SettingViewController로 연결하고

Navigation Bar 타이틀을 설정으로 변경하고 스택 뷰로 오브젝트 아이템들을 배치했다.

---

**Stack View (전광판 글자) **
- Spacing: 15
- Aling Top: 24
- Aling Traling: 24
- Algin Leading: 24

Obejct Item: Label (전광판에 표시할 글자)

Object Item: Text Field (Placeholder: 전광판에 표시할 글자)
- Aling Traling: 0
- Algin Leading: 0

---

**Stack View (텍스트 색상) **
- Spacing: 15
- Aling Top: 35
- Aling Traling: 24
- Algin Leading: 24

Obejct Item: Label (텍스트 색상 설정)

**Stack View(텍스트 색상 버튼 모음)**

Object Item: Button
-> image(Assets) : yellow_circle

Object Item: Button
-> image(Assets) : purple_circle

Object Item: Button
-> image(Assets) : green_circle

---

**Stack View (배경 색상) **
- Spacing: 15
- Aling Top: 35
- Aling Traling: 24
- Algin Leading: 24

Obejct Item: Label (배경 색상 설정)

**Stack View(배경 색상 버튼 모음)**

Object Item: Button
-> image(Assets) : black_circle

Object Item: Button
-> image(Assets) : blue_circle

Object Item: Button
-> image(Assets) : orange_circle

---

#### Button (저장)
가운데 정렬
- Center Horizontally -> Stack View(배경 색상)
- Aling Top: 24


---

### 코드 구현

먼저 설정 뷰의 SettingViewController에 오브젝트들을 연결 해주었고, 설정 값을 ViewController로 보내주기 위해 델리게이트를 생성하였다.

``` swift
SettingViewController.swift

import UIKit

// 설정 및 변경값(텍스트, 텍스트 색상, 배경 색상) 넘겨주는 델리게이트 생성
protocol LEDBoardSettingDelegate: AnyObject {
	func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {
	
    // Text Field
    @IBOutlet weak var textField: UITextField!
    
    // Text Colors
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    
    // Background Colors
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    // 초기 세팅 값 지정
    weak var delegate: LEDBoardSettingDelegate?
    var ledText: String?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black 
```
이후 초기 세팅 값 지정, 설정 뷰 저장값 유지 기능, 색상 버튼 선택 기능 및 처리, 저장 버튼 기능을 구현하였다.

```swift
	// 메모리 로드 호출 
    override func viewDidLoad() {
        super.viewDidLoad()
        // 설정 값 로드 
        self.configureView()
    }
    
	// 설정 값 초기화 방지 및 저장 기능 (설정 저장 후 LED 뷰에서 설정 뷰로 갔을 때 기존 값 유지)
    private func configureView() {
    	if let ledText = self.ledText {
        	self.textField.text = ledText
        }
        self.changeTextColor(
    
    // 글자 색상 버튼 눌림 기능
    @IBAction func tapTextColorButton(_ sender: UIButton) {
		if sender == self.yellowButton {
        	self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.purpleButton {
        	self.changeTextColor(color: .purple)
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
    
    // 글자 색상 버튼 활성화 처리 (삼항연산자 Alpha값 조정)
    private func changeTextColor(color: UIColor) {
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    // 배경 색상 버튼 활성화 처리 (삼항연산자 Alpha값 조정)
    private func changeBackgroundColorButton(color: UIColor){
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }
    
    // 저장 버튼 기능 (저장 및 색상 보내기)
    @IBAction func tapSaveButton(_ sender: UIButton) {
    	self.delegate?.changedSetting(
        	text: textField.text,
            textColor: textColor,
            backgroundColor: backgroundColor
        )
        // 이전 뷰로 이동
        self.navigationController?.popViewController(animated: true)
    }
}
```
