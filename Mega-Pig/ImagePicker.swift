//
//  ImagePicker.swift
//  Mega-Pig
//
//  Created by Choi Inho on 2022/04/14.
//

import Foundation
import SwiftUI

class ImagePickerCoordinator : NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
	@Binding var image : UIImage?
	@Binding var isShown : Bool
	
	init(image : Binding<UIImage?>, isShown : Binding<Bool>){
		_image = image
		_isShown = isShown
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
			image = uiImage
			isShown = false
			print("First")
		}
	}
	
}

struct ImagePicker : UIViewControllerRepresentable {
	
	typealias UIViewControllerType = UIImagePickerController
	typealias Coordinator = ImagePickerCoordinator
	
	@Binding var image : UIImage?
	@Binding var isShown : Bool
	var sourceType : UIImagePickerController.SourceType = .camera
	
	func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
	}
	
	func makeCoordinator() -> ImagePicker.Coordinator {
		return ImagePickerCoordinator(image: $image, isShown : $isShown)
	}
	
	func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
		let picker = UIImagePickerController()
		picker.sourceType = sourceType
		picker.delegate = context.coordinator
		return picker
	}
	
}
