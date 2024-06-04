//
//  SettingTableViewController.swift
//  TableViewExample
//
//  Created by 김윤우 on 5/23/24.
//

import UIKit
enum SettingOptions: Int, CaseIterable {
    
    case total, personal, others
    
    var mainOptions: String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
        }
    }
    
    var subOptions: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others:
            return ["전체 설정", "개인 설정", "기타"]
        }
    }
}


class SettingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // 섹션 개수
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return SettingOptions.allCases.count
    }
    
    // Header 설정
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        if section == SettingOptions.total.rawValue {
            return SettingOptions.total.mainOptions
        } else if section == SettingOptions.personal.rawValue {
            return SettingOptions.personal.mainOptions
        } else {
            return SettingOptions.others.mainOptions
        }
        
    }
    
    // 각 세션에 들어가는 셀의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return SettingOptions.allCases[section].subOptions.count
    }
    
    
    
    
    
    // 각 셀 구현
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!

        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].subOptions[indexPath.row]
    
        return cell
    }
    
    func configureTableView() {
        
        tableView.rowHeight = 44
    }
    
}
