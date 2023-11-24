//
//  ViewController.swift
//  CameraDemo
//
//  Created by 정인선 on 11/24/23.
//

/**
 사용자가 터치
 - 첫 번째 버튼을 누르면 사용자에게 카메라가 표시되고 사진을 촬영할 수 있으며,
 - 이후에 이미지 보기에 해당 사진이 표시
 두 번째 버튼
 - 사용자가 기존 사진 이미지를 선택할 수 있는 카메라 롤에 대한 액세스를 제공
 - 카메라로 촬영한 새 이미지의 경우 카메라 롤에 저장
 
 #MARK: 카메라와 사진 라이브러리 액세스 허용하기
 - 프로젝트 탐색기 패널 상단에서 카메라 항목을 선택하고 기본 패널에서 정보 Info 탭을 선택
 - 다음으로, Custom iOS Target Properties 섹션의 마지막 속성 줄에last line of properties 포함된 + 버튼을 클릭
 - 그런 다음 나타나는 메뉴에서 개인 정보 ‒ 카메라 사용 설명Privacy – Camera Usage Description 항목을 선택
 - 키가 추가되면 해당 값 열을 두 번 클릭하고 사용자가 보기를 원하는 메세지를 입력
 */

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
import AVKit
import AVFoundation

class ViewController: UIViewController, 
                        UIImagePickerControllerDelegate,
                        UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    
    // 뒷부분에서 필요할 Boolean 속성 선언 (새로운건지 판별)
    var newmedia: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func useCamera(_ sender: Any) {
        // 카메라 촬영하면 어떤일이 발생하는지
        // UIImagePickerController에서 소스타입 사용할 수 있는지 판별
        // 소스 타입: .camera, .savedPhotosAlbum, .photoLibrary
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [UTType.image.identifier]
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
            
            newmedia = true
        }
    }
    
    @IBAction func useCameraRoll(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum) {
            
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [UTType.image.identifier]
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
            
            newmedia = false
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // UIImagePickerController.InfoKey.mediaType
        let mediaType = info[.mediaType] as! NSString
        
        self.dismiss(animated: true, completion: nil)
        
        if mediaType.isEqual(to: UTType.image.identifier) {
            let image = info[.originalImage] as! UIImage
            
            // 이미지 화면에 뿌려주기
            imageView.image = image
            
            if (newmedia == true) {
                // 새로운 이미지면 리소스에 저장
                UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
                
                // 오류가 발생하면 경고 상자를 통해 사용자에게 보고하고 싶은 경우
//                UIImageWriteToSavedPhotosAlbum(image, self, #selector(ViewController.image(image:didFinishSavingWtithError:contextInfo:)), nil)
                
            } else {
                
            }
            
        } else if mediaType.isEqual(to: UTType.video.identifier) {
            // 근데 동영상은 아직 처리 안해줌 코드 짜야됨
        }
    }
    
    // 오류가 발생하면 경고 상자를 통해 사용자에게 보고하는 오브젝트 씨 함수
    @objc func image(image: UIImage, didFinishSavingWtithError error: NSErrorPointer, contextInfo: UnsafeRawPointer) {
        
        if error != nil {
//            print("Error")
            let alert = UIAlertController(title: "Save Failed", message: "Failed to save image", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel)
            
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let dest = segue.destination as! AVPlayerViewController
        let url = URL(string: "https://www.ebookfrenzy.com/ios_book/movie/movie.mov")
        
        if let movieURL = url {
            dest.player = AVPlayer(url: movieURL)
        }
    }
}

