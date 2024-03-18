//
//  ApiClient.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import UIKit

class ApiClient {

    static let shared = ApiClient()
    private let url = "https://api.thecatapi.com/v1/breeds?limit=30"

    func fetchCats(completion: @escaping ([Breed]) -> Void) {
        guard let url = URL(string: url) else {
            print("Неверный  URL")
            completion([])
            return
        }

        var request = URLRequest(url: url)
        request.addValue("live_gfuI2JqWKrZ8tJyen33iuVHuiIEUEeZlCQud1Xq1oj96y67ZQThYc8pmf3qCI2IB", forHTTPHeaderField: "x-api-key")
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Ошибка при получении данных:", error?.localizedDescription ?? "Unknown error")
                completion([])
                return
            }
            do {
                let breeds = try JSONDecoder().decode([Breed].self, from: data)
                let cats = breeds
                completion(cats)
            } catch {
                print("Ошибка при декодировании данных:", error.localizedDescription)
                completion([])
            }
        }.resume()
    }
}

