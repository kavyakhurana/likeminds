//
//  TableViewInteractor.swift
//  likeminds_assignment
//
//  Created by Kavya Khurana on 06/07/23.
//

import Foundation
import RxSwift

class TableViewInteractor: TableViewInteractorProtocol {
    
    var dataSubj = PublishSubject<[Results]>()
    
//    var router: TableViewRouterProtocol?
    let url = "https://itunes.apple.com/search?term=adele"
    
    func viewLoaded() {
        getDataFrom(urlString: url)
    }
    
    func getDataFrom(urlString: String) {
        guard let url = URL(string: urlString) else {
            print("couldnt parse url string")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
           
            guard error == nil else {
                print("error in getting data \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let data = data else {
                print("couldnt get data")
                return
            }
            
            print(data)
            
            do {
                 let decoder = JSONDecoder()
                 let decodedData = try decoder.decode(Result.self, from: data)
                 
                DispatchQueue.main.async { [weak self] in
                    let tempData = decodedData.results
                    print(tempData)
                    self?.dataSubj.onNext(tempData)
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
}
