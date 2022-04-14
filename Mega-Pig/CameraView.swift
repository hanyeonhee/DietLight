//
//  CameraView.swift
//  Mega-Pig
//
//  Created by Choi Inho on 2022/04/14.
//

import SwiftUI

struct CameraView: View {
	
	@State private var showSheet : Bool = false
	@State private var showImagePicker : Bool = false
	@State private var sourceType : UIImagePickerController.SourceType = .camera
	@Binding private var image : UIImage?
	
	init(image : Binding<UIImage?>){
		_image = image
	}
	
	var body: some View {
		NavigationView {
			VStack{
				
				Image(uiImage: image ?? UIImage(named: "placeholder")!)
					.resizable()
					.frame(width: 300, height: 300)
				
				Button("Choose Picture") {
					self.showSheet = true
				}.padding()
					.actionSheet(isPresented : $showSheet){
						ActionSheet(title: Text("Select Photo"),
									message: Text("Choose"), buttons: [
										.default(Text("Photo Library")) {
											self.showImagePicker = true
											self.sourceType = .photoLibrary
										},
										.default(Text("Camera")) {
											self.showImagePicker = true
											self.sourceType = .camera
											print("SECOND")
										},
										.cancel()
									])
					}
				
			}.navigationTitle("Camera Demo")
		}.sheet(isPresented: $showImagePicker) {
			ImagePicker(image: $image, isShown: self.$showImagePicker, sourceType: self.sourceType)
		}
	}
}
