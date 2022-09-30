//
//  DetailViewController.swift
//  MovieInfo
//
//  Created by 모상현 on 2022/09/30.
//

import UIKit
import PhotosUI

final class DetailViewController: UIViewController {

    var editSwitch:Bool = false
    var movieData: Movie?
    var memberNum: Int = 0
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var detailNameTF: UITextField!
    @IBOutlet weak var detailDescriptionTV: UITextView!
    @IBOutlet weak var updateBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        데이터불러오기()
        컴포넌트디자인()
        노티피케이션()
        확장()
    }
    func 확장(){
        detailNameTF.delegate = self
        detailDescriptionTV.delegate = self
    }
    func 데이터불러오기(){
        guard var movieData = movieData else { return }
        memberNum = movieData.movieNum
        detailImageView.image = movieData.movieImage
        detailNameLabel.text = movieData.movieName
        detailDescriptionLabel.text = movieData.movieDescription
    }
    func 컴포넌트디자인(){
        detailImageView.clipsToBounds = true
        detailImageView.layer.cornerRadius = detailImageView.frame.width / 2
    }
    func 제스처부여하기(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(이미지를눌렀을때))
        detailImageView.addGestureRecognizer(tapGesture) // 제스처를 추가....
        detailImageView.isUserInteractionEnabled = true // 유저와의 소통을 가능하게...
    }
    @objc func 이미지를눌렀을때(){
        ///피커뷰를 사용하기 위해서 configuration을 먼저 설정해준다.
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1 //사진을 무한대로 가지고 올 수 있는... 1이면 1개만, 2는 2개만 가져온다.
        configuration.filter = .any(of: [.images, .videos]) // 지금은 사진과 비디오를 가져올 수 있게 설정하였다.
        /// 기본 설정을 가지고, 피커뷰컨트롤러 생성
        let picker = PHPickerViewController(configuration: configuration)
        /// 피커뷰 컨트롤러의 대리자 설정
        picker.delegate = self
        /// 피커뷰 띄우기
        self.present(picker, animated: true,completion: nil)
    }
    
    func 노티피케이션(){
        NotificationCenter.default.addObserver(self, selector: #selector(키보드올라옴), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(키보드내려옴), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    @objc func 키보드올라옴(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2
                }
            }
    }
    @objc func 키보드내려옴(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    @IBAction func editBtn(_ sender: UIButton) {
        if editSwitch == false{
            updateBtn.setTitle("Save", for: .normal)
            editSwitch.toggle()
         
            detailNameLabel.isHidden = true
            detailDescriptionLabel.isHidden = true
            detailNameTF.isHidden = false
            detailDescriptionTV.isHidden = false
            
            detailNameTF.text = detailNameLabel.text
            detailDescriptionTV.text = detailDescriptionLabel.text
            제스처부여하기()
            
        }else{
            updateBtn.setTitle("Edit", for: .normal)
            editSwitch.toggle()
            
            detailNameLabel.isHidden = false
            detailDescriptionLabel.isHidden = false
            detailNameTF.isHidden = true
            detailDescriptionTV.isHidden = true
            
            let index = navigationController!.viewControllers.count - 2
            let vc = navigationController!.viewControllers[index] as! ViewController
            vc.dataManager.updateMovieData(index: memberNum, movieData!)
            detailImageView.isUserInteractionEnabled = false
            
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
extension DetailViewController:UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            textView.resignFirstResponder()
            return false
        }else{
            return true
        }
    }
}
extension DetailViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension DetailViewController: PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self){
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    self.detailImageView.image = image as? UIImage
                }
            }
        }else {
            print("이미지를 불러올 수 없습니다.")
        }
    }
    
    
}
