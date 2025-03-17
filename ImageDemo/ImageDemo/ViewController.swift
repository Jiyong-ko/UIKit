//
//  ViewController.swift
//  ImageDemo
//
//  Created by NoelMacMini on 3/17/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 기본 도형 표시
        setupShapes()
    }
    
    // MARK: - UI 설정
    func setupUI() {
        
    }

    // MARK: - 기본 도형 표시
    func setupShapes() {
        
        // 제목 레이블
        let titleLabel = UILabel()
        titleLabel.text = "1. 기본 도형"
        titleLabel.font = .systemFont(ofSize: 24)
    }

}

