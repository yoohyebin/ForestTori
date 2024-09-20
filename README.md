# 🌳 은둔청년 생활습관 개선 앱 숲토리
<p align="center">
    <img width="500" alt="image" src="https://github.com/user-attachments/assets/e7641f8a-3a38-4ee6-b6c3-26ed60815538">
</p>
  
<a href='https://apps.apple.com/kr/app/%EC%88%B2%ED%86%A0%EB%A6%AC/id6502944860?l=en-GB'><img alt='Available on the App Store' src='https://user-images.githubusercontent.com/67373938/227817078-7aab7bea-3af0-4930-b341-1a166a39501d.svg' height='60px'/></a> 

## 📖 프로젝트 소개
- 숲토리는 은둔 청년들이 생활 습관을 개선하고 자존감을 회복하도록 돕는 앱입니다.
- 사용자는 단계별로 미션을 수행하며 서서히 일상으로 돌아갈 준비를 하게 됩니다.
- 각 단계마다 미션을 선택하여 완료한 후, 해당 미션에 대한 감정과 후기를 일지로 작성할 수 있으며, 완료된 미션들은 "정원"에서 모아 볼 수 있습니다.
- 이 정원은 AR로 실제 세상에 존재하는 것처럼 카메라를 통해 시각화됩니다.

## ☺️ 멤버 소개
|🫒Olive (UI/UX 디렉터)|🌻Helia (CTO) |🗽NewYork (PM)|
|:---:|:---:|:---:|
|<img alt="" src="https://github.com/olionoleo.png" width="150">|<img alt="" src="https://github.com/yoohyebin.png" width="150">|<img alt="" src="https://github.com/NewYorkKim.png" width="150">|
|UI/UX 디자인, 기획|개발, 기획|개발, 기획|

---

## 🔧 Stacks 

### Environment
![Xcode](https://img.shields.io/badge/Xcode-147EFB?style=for-the-badge&logo=Xcode&logoColor=white)
![Github](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white)               

### Development
![Swift](https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=Swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-0086c8?style=for-the-badge&logo=Swift&logoColor=white)
![Realm](https://img.shields.io/badge/Realm-39477F?style=for-the-badge&logo=Realm&logoColor=white)

### Communication
![Notion](https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=Notion&logoColor=white)
![Discord](https://img.shields.io/badge/discord-5865F2?style=for-the-badge&logo=discord&logoColor=white)

### Framework
**ARKit**
- 증강 현실(AR) 프레임워크입니다.
- 정원을 실제 생활 속에 존재하는 것처럼 나타내기 위해 사용되었습니다.

**SceneKit**
- 3D 그래픽스 프레임워크로, 3D 콘텐츠를 생성하고 렌더링하는 프레임워크입니다.
- 사용자와 상호작용할 수 있는 3D 오브젝트를 생성하고 렌더링하는 데 사용되었습니다.
---
## ⭐ Main Feature
### 단계별 미션 수행
- 사용자는 4개의 챕터를 거치며 미션을 차례로 수행하게 됩니다.
- 각 챕터의 미션 난이도는 점차 상승하며, 미션 완료 후에는 사진과 기록을 포함한 성장일지를 작성합니다.

### 정원
- 사용자는 완료한 미션을 정원에서 확인할 수 있습니다.
- 정원에는 완료된 미션을 상징하는 식물이 심어지며, 각 식물을 선택하면 해당 미션의 성장일지를 확인할 수 있습니다.

### AR 기능
- 사용자는 AR을 통해 정원을 생동감 있게 감상할 수 있으며, 이를 통해 실제 생활 속에서 미션 수행에 대한 동기부여를 받습니다.
---

## 🐈‍⬛ Git Branch
[Git 전략](https://github.com/DevTillDie/ForestTori/wiki)

## 📂 Project Structure

```
├─ .swiftlint.yml
├─ ForestToriApp.swift
├─ Info.plist
├─ Preview Content
├─ Resource
│  ├─ 3D_Objects
│  ├─ Assets.xcassets
│  ├─ Chapters
│  │  ├─ AutumnPlants.tsv
│  │  ├─ Chapters.tsv
│  │  ├─ SpringPlants.tsv
│  │  ├─ SummerPlants.tsv
│  │  └─ WinterPlants.tsv
│  ├─ CharacterDialogues
│  │  ├─ AutumnCharacter.tsv
│  │  ├─ SpringCharacter.tsv
│  │  ├─ SummerCharacter.tsv
│  │  └─ WinterCharacter.tsv
│  └─ Pretendard
└─ Source
   ├─ Ending
   │  ├─ EndingView.swift
   │  └─ EpilogueView.swift
   ├─ Model
   │  ├─ Chapter.swift
   │  ├─ Dialogue.swift
   │  ├─ GardenPlant.swift
   │  ├─ History.swift
   │  ├─ Mission.swift
   │  ├─ Onboarding.swift
   │  ├─ Plant.swift
   │  └─ User.swift
   ├─ Utils
   │  ├─ Component
   │  │  ├─ BottomSheet.swift
   │  │  ├─ Buttons
   │  │  │  ├─ OnboardingDoneButton.swift
   │  │  │  └─ OnboardingSkipButton.swift
   │  │  ├─ ChapterButtonStyle.swift
   │  │  ├─ ProgressStyle.swift
   │  │  ├─ Scenes
   │  │  │  └─ GardenScene.swift
   │  │  ├─ TextBoxes
   │  │  │  └─ OnboardingTextBox.swift
   │  │  └─ UnevenRoundedRectangle.swift
   │  ├─ Extension
   │  │  ├─ Date+.swift
   │  │  ├─ Font+.swift
   │  │  ├─ String+.swift
   │  │  └─ View+.swift
   │  ├─ KeyboardHandler.swift
   │  └─ Manager
   │     ├─ DataManager.swift
   │     ├─ GameManager.swift
   │     ├─ NotificationManager.swift
   │     └─ RealmManager.swift
   ├─ View
   │  ├─ Garden
   │  │  ├─ CameraPreview.swift
   │  │  ├─ GardenARView.swift
   │  │  ├─ GardenView.swift
   │  │  ├─ HistoryDetailView.swift
   │  │  └─ HistoryView.swift
   │  ├─ Main
   │  │  ├─ CompleteMissionView.swift
   │  │  ├─ History
   │  │  │  ├─ ImageCropView.swift
   │  │  │  ├─ ImagePicker.swift
   │  │  │  └─ WriteHistoryView.swift
   │  │  ├─ MainView.swift
   │  │  ├─ PlantCardView.swift
   │  │  ├─ PlantPotView.swift
   │  │  ├─ PlantView.swift
   │  │  └─ SelectPlantView.swift
   │  ├─ Onboarding
   │  │  ├─ NameSettingView.swift
   │  │  ├─ OnboardingCompletionView.swift
   │  │  ├─ OnboardingGreetingView.swift
   │  │  ├─ OnboardingIntroductionView.swift
   │  │  ├─ OnboardingNamingView.swift
   │  │  └─ OnboardingView.swift
   │  └─ ServieStateView.swift
   └─ ViewModel
      ├─ EpilogueViewModel.swift
      ├─ GardenARViewModel.swift
      ├─ GardenViewModel.swift
      ├─ HistoryViewModel.swift
      ├─ MainViewModel.swift
      ├─ OnboardingViewModel.swift
      ├─ ServiceStateViewModel.swift
      └─ WriteHistoryViewModel.swift

```
---

## 👩🏻‍💻 Role
- 서비스 기획
- UI 및 인터랙션 구현
- AR 기능 구현
- 데이터베이스 구축  

## 💡 Learnings and Insights
- 기술 팀장으로서 기능 명세서 작성부터 코드 컨벤션 및 브랜치 전략 관리의 중요성을 실감하며, 이를 통해 기술 관리 능력을 한층 더 성장시킬 수 있었습니다.
- ARKit과 SceneKit을 활용한 신기술을 앱에 적용하면서 큰 흥미를 느꼈고, 새로운 도전에 대한 즐거움을 경험했습니다.
