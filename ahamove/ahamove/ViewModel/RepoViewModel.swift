//
//  RepoViewModel.swift
//  ahamove
//
//  Created by Nghia on 21/09/2024.
//

import Foundation
import Alamofire

class RepoViewModel: ObservableObject {
    @Published var organization: Organization? = nil
    @Published var repositories: [RepositoryElement]? = nil
    @Published var errorMessage: String?
    
    func fetchOrganization(complete: @escaping () -> Void) {
        let url = SeverAPI.fetchOrganization.rawValue
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        AF.request(url,
                   method: SeverAPI.fetchOrganization.httpMethod,
                   encoding: 
                    JSONEncoding.default,
                   headers: headers)
        .responseDecodable(of: Organization.self) { response in
            switch response.result {
            case .success(let decodedData):
                DispatchQueue.main.async {
                    self.organization = decodedData
                    self.fetchRepositories() 
                    complete()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = "Error: \(error.localizedDescription)"
                    complete()
                }
            }
        }
    }
    
    func fetchRepositories() {
        let url = SeverAPI.fetchRepositories.rawValue
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        AF.request(url, method: SeverAPI.fetchRepositories.httpMethod, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: [RepositoryElement].self) { response in
                switch response.result {
                case .success(let decodedData):
                    DispatchQueue.main.async {
                        self.repositories = decodedData
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.errorMessage = "Error: \(error.localizedDescription)"
                    }
                }
            }
    }
    
}
