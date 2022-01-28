//
//  structures.swift
//  Joy
//
//  Created by Dennis Knierim on 14.01.22.
//

import Foundation



struct Quote: Decodable{
    var jsonstring: [String: String]
    }
struct Dtask: Decodable{
    var jsonstring: [String: String]
}

final class User: ObservableObject{
     @Published var username: String = "Tobias"
     @Published var password: String = "123"
     @Published var emotions: String = "sad"
     @Published var journal: String = ""
}
class Api{
    func loadData(competion: @escaping ([Quote]) -> ()){
        let url = URL(string: "https://webtechlecture.appspot.com/cloudstore/listobjects/?owner=s201670_quotes")
        print("got url")
        URLSession.shared.dataTask(with: url!) {data, _, _ in
            let quotes = try! JSONDecoder().decode([Quote].self, from: data!)
            DispatchQueue.main.async {
                competion(quotes)

            }
        }
        .resume()
    }
    func loadTasks(competion: @escaping ([Dtask]) -> ()){
        let url = URL(string: "https://webtechlecture.appspot.com/cloudstore/listobjects/?owner=s201670_challenges")
        print("got url")
        URLSession.shared.dataTask(with: url!) {data, _, _ in
            let dtasks = try! JSONDecoder().decode([Dtask].self, from: data!)
            DispatchQueue.main.async {
                competion(dtasks)

            }
        }
        .resume()
    }
    
}




