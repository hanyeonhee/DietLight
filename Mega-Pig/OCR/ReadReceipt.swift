//
//  ReadReceipt.swift
//  Mega-Pig
//
//  Created by Choi Inho on 2022/04/11.
//

import Foundation
import SwiftUI
import MLKitTextRecognition
import MLKitTextRecognitionKorean
import MLKitVision

func readReceipt(img : UIImage) async -> String?{
	let koreanOptions = KoreanTextRecognizerOptions()
	let koreanTextRecognizer = TextRecognizer.textRecognizer(options: koreanOptions)

	let vimg = VisionImage(image: img)
	vimg.orientation = img.imageOrientation
	print(vimg.hashValue)
	
	do {
		let str = try await koreanTextRecognizer.process(vimg as MLKitCompatibleImage).text
		
		let text = str.split(separator: "\n")
		
		print(analyzeText(text))
		
		return str
		
	} catch {
		print("Read Receipt ERROR [OCR/ReadReceipt.swift -> readReceipt]")
		return nil
	}
}

func analyzeText(_ str : Array<Substring>) -> Set<String>{
	var answer : Set<String> = []
	for line in str {
		for buger in bugerKing{
			if line.contains(buger.key){
				answer.insert(buger.key)
			}
		}
	}
	return answer
}
