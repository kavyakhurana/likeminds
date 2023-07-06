//
//  TableViewPresenter.swift
//  likeminds_assignment
//
//  Created by Kavya Khurana on 06/07/23.
//

import Foundation
import RxSwift

class TableViewPresenter: TableViewPresenterProtocol {
    
    var refreshSubj = PublishSubject<Void>()
    
    var interactor: TableViewInteractorProtocol?
    var results: [Results] = []
    let disposeBag = DisposeBag()
    
    init(interactor: TableViewInteractorProtocol) {
        self.interactor = interactor
    }
    
    func viewLoaded() {
        subscribeObservables()
        interactor?.viewLoaded()
    }
    
    func subscribeObservables() {
        interactor?.dataSubj.subscribe(onNext: { [weak self] result in
            self?.results = result
            self?.refreshSubj.onNext(())
        }).disposed(by: disposeBag)
    }
    
    func getNumberOfCells() -> Int {
        return results.count
    }
    
    func getCellData(for indexPath: IndexPath) -> Results {
        return results[indexPath.row]
    }
    
    
}
