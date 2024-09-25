//
//  AppSetting.swift
//  ahamove
//
//  Created by Nghia on 25/09/2024.
//

import Foundation
import Alamofire

enum SeverAPI: String {
    case fetchOrganization = "https://api.github.com/orgs/google"
    case fetchRepositories = "https://api.github.com/orgs/google/repos?page=0&per_page=20"

    var httpMethod: HTTPMethod {
        switch self {
        case .fetchOrganization: return .get
        case .fetchRepositories: return .get
        }
    }
    
}
