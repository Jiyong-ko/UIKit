//
//  ViewController.swift
//  UIKitTODOList
//
//  Created by NoelMacMini on 3/21/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView delegate, dataSource 설정
        tableView.delegate = self
        tableView.dataSource = self
        
        // 네비게이션 바 타이틀 설정
        title = "TODO List"
        
        // 오른쪽 상단 추가 버튼 설정
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewTask)
        )
    }
    
    
    // 새 할 일 추가 기능
    @objc func addNewTask() {
        // 알림창 생성
        let alert = UIAlertController(
            title: "새 할 일",
            message: "할 일을 입력해주세요",
            preferredStyle: .alert
        )
        
        // 텍스트 필드 추가
        alert.addTextField { textField in
            textField.placeholder = "할 일을 입력하세요"
        }
        
        // 취소 버튼
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        // 추가 버튼
        let addAction = UIAlertAction(title: "추가", style: .default) { [weak self] _ in
            guard let textField = alert.textFields?.first,
                  let text = textField.text, !text.isEmpty else { return }
            
            // 새 할 일 추가
            self?.tasks.append(text)
            
            // 테이블 뷰 갱신
            self?.tableView.reloadData()
        }
        
        // 알림창에 액션 추가
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        
        // 알림창 표시
        present(alert, animated: true)
    }
    
    // 테이블 뷰 스와이프 삭제 구현
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 데이터에서 항목 삭제
            tasks.remove(at: indexPath.row)
            
            // 테이블 뷰에서 행 삭제
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - TableView DataSource 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }


}

