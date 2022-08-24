//
//  UserImfo.swift
//  winwinHW
//
//  Created by Yushan Yang on 2022/8/24.
//

import Foundation
struct Winwin: Codable {
    var code: Int
    var message: String
    var data: UserData
}

struct UserData: Codable {
    var totalCount: Int
    var items: [UserImfo]
}

struct UserImfo: Codable {
    var user: User
    var tags: [String]
}

struct User: Codable {
    var nickName: String
    var imageUrl: String
}


class WinwinManager {
    static let shared: WinwinManager = WinwinManager()
    
    func getData(completion: @escaping (Result<Winwin, Error>) -> Void) {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/winwiniosapp/interview/main/interview.json") else { return }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
            }
            
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let data = try decoder.decode(Winwin.self, from: data)
                    completion(Result<Winwin, Error>.success(data))
                } catch {
                    completion(Result.failure(error))
                }
            }
        }.resume()
    }
}
