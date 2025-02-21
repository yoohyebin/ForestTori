//
//  WriteHistoryView.swift
//  ForestTori
//
//  Created by hyebin on 4/15/24.
//

import SwiftUI

struct WriteHistoryView: View {
    @StateObject var viewModel = WriteHistoryViewModel()
    @EnvironmentObject var keyboardHandler: KeyboardHandler
    @FocusState private var isFocused: Bool
    
    @State private var croppedImage: UIImage?
    @State private var isShowSelectImagePopup = false
    @State private var isShowCameraPicker = false
    @State private var isShowPhotoLibraryPicker = false
    @State var isShowCropView = false
    
    @Binding var isComplete: Bool
    @Binding var isShowHistoryView: Bool
    @Binding var currentStatus: MissionStatus

    private let placeHolder = "오늘의 활동과 감정을 적어보세요"
    var plantName: String
    
    var body: some View {
        VStack {
            hisoryViewHeader
            
            ScrollViewReader { proxy in
                ScrollView(showsIndicators: false) {
                    selectImageView
                        .aspectRatio(1, contentMode: .fill)
                        .padding(.horizontal)
                        .padding(.vertical)
                    
                    writeHistoryView
                        .id("writeHistoryView")
                        .onChange(of: isFocused) { focused in
                            if focused {
                                withAnimation {
                                    proxy.scrollTo("writeHistoryView", anchor: .bottom)
                                }
                            }
                        }
                }
            }
        }
        .fullScreenCover(isPresented: $isShowCameraPicker) {
            ImagePicker(selectedImage: $viewModel.selectedImage,
                        sourceType: .camera)
                .ignoresSafeArea()
                .onAppear {
                    isShowSelectImagePopup = false
                }
        }
        .sheet(isPresented: $isShowPhotoLibraryPicker) {
            ImagePicker(selectedImage: $viewModel.selectedImage,
                        sourceType: .photoLibrary)
                .ignoresSafeArea()
                .onAppear {
                    isShowSelectImagePopup = false
                }
                .onDisappear {
                    isShowCropView = true
                }
        }
        .sheet(isPresented: $isShowCropView) {
            isShowCropView = false
            isShowCameraPicker = false
            isShowPhotoLibraryPicker = false
        } content: {
            ImageCropView(
                isShowCropView: $isShowCropView, image: viewModel.selectedImage
            ) { croppedImage, _ in
                if let croppedImage {
                    viewModel.selectedImage = croppedImage
                }
            }
        }
        .onTapGesture {
            isFocused = false
        }
        .onAppear {
            viewModel.plantName = plantName
        }
    }
}

// MARK: - UI

extension WriteHistoryView {
    private var hisoryViewHeader: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        isShowHistoryView = false
                        currentStatus = .inProgress
                    }
                } label: {
                    Text(Image(systemName: "chevron.backward"))
                        .bold()
                        .foregroundStyle(.gray40)
                }
                
                Spacer()
                
                Text("성장일지")
                    .font(.subtitleL)
                
                Spacer()
                
                Button {
                    viewModel.saveHistory()
                    isComplete = true
                } label: {
                    Text("완료")
                        .font(.subtitleM)
                        .bold()
                        .foregroundStyle(viewModel.isCompleteButtonDisable ? .gray30 : .greenSecondary)
                }
                .disabled(viewModel.isCompleteButtonDisable)
            }
            .padding(.leading, 8)
            .padding(.trailing, 16)
            .padding(.top, 11)
            .padding(.bottom, 6)
            
            Rectangle()
                .fill(.gray30)
                .frame(height: 0.33)
        }
    }
    
    private var selectImageView: some View {
        VStack {
            if let image = viewModel.selectedImage {
                ZStack {
                    Image(uiImage: image)
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(alignment: .bottomTrailing) {
                            Button {
                                withAnimation {
                                    isShowSelectImagePopup.toggle()
                                }
                            } label: {
                                Image(systemName: "camera")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.white)
                                    .background {
                                        Circle()
                                            .fill(.gray50)
                                            .scaledToFit()
                                            .padding(-8)
                                    }
                                    .padding()
                            }
                        }
                    
                    if isShowSelectImagePopup {
                        selectImagePopup
                    }
                }
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(.gray.opacity(0.2))
                    selectImagePopup
                }
            }
        }
    }
    
    private var writeHistoryView: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(Color.gray10)
            .frame(height: 298)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.brownSecondary, lineWidth: 2)
            }
            .overlay(alignment: .center) {
                    TextEditor(
                        text: Binding(
                            get: {viewModel.todayHistory},
                            set: { newValue, _ in
                                if newValue.lastIndex(of: "\n") != nil {
                                    isFocused = false
                                } else {
                                    viewModel.todayHistory = newValue
                                }
                            })
                    )
                    .padding(-8)
                .overlay(alignment: .topLeading) {
                    Text(placeHolder)
                        .foregroundStyle(viewModel.todayHistory.isEmpty ? .gray30 : .clear)
                        .padding(.horizontal, -4)
                }
                .overlay(alignment: .bottomTrailing) {
                    Text("\(viewModel.todayHistory.count) / 300")
                        .foregroundStyle(.gray30)
                        .onChange(of: viewModel.todayHistory) { newValue in
                            if newValue.count > 300 {
                                viewModel.todayHistory = String(newValue.prefix(300))
                            }
                        }
                }
                .transparentScrolling()
                .focused($isFocused)
                .submitLabel(.done)
                .disableAutocorrection(true)
                .tint(.greenSecondary)
                .font(.bodyM)
                .foregroundStyle(.gray50)
                .padding()
            }
            .padding(.horizontal)
            .padding(.bottom, 26)
            .onTapGesture {
                isFocused = true
            }
    }
    
    private var selectImagePopup: some View {
        HStack {
            Spacer(minLength: 56)
            
            VStack {
                Button {
                    isFocused = false
                    isShowCameraPicker = true
                }label: {
                    HStack {
                        Text("사진 찍기")
                        Spacer()
                        Image(systemName: "camera")
                            .font(.system(size: 22))
                    }
                }
                
                Divider()
                
                Button {
                    isFocused = false
                    isShowPhotoLibraryPicker = true
                }label: {
                    HStack {
                        Text("사진 선택")
                        Spacer()
                        Image(systemName: "photo")
                            .font(.system(size: 22))
                    }
                }
            }
            .foregroundStyle(.black)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(.white)
            )
            
            Spacer(minLength: 56)
        }
    }
}

#Preview {
    MainView()
}
