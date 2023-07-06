//
//  TableViewProtocols.swift
//  likeminds_assignment
//
//  Created by Kavya Khurana on 06/07/23.
//

import Foundation
import RxSwift

protocol TableViewPresenterProtocol {
    var refreshSubj: PublishSubject<Void> { get }
    func viewLoaded()
    func getNumberOfCells() -> Int
    func getCellData(for indexPath: IndexPath) -> Results
}

protocol TableViewInteractorProtocol {
    var dataSubj: PublishSubject<[Results]> { get }
    func viewLoaded()
}

protocol TableViewRouterProtocol {
    
}

