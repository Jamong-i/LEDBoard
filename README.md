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

Object Item: Button (노란색)
Object Item: Button (자주색)
Object Item: Button (초록색)

---

**Stack View (배경 색상) **
- Spacing: 15
- Aling Top: 35
- Aling Traling: 24
- Algin Leading: 24

Obejct Item: Label (배경 색상 설정)

**Stack View(배경 색상 버튼 모음)**

Object Item: Button (검정색)
Object Item: Button (파랑색)
Object Item: Button (주황색)

---

#### Button (저장)
가운데 정렬
- Center Horizontally -> Stack View(배경 색상)
- Aling Top: 24
