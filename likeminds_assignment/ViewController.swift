//
//  ViewController.swift
//  likeminds_assignment
//
//  Created by Kavya Khurana on 06/07/23.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
   
    
    var presenter: TableViewPresenterProtocol?
    let disposeBag = DisposeBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        let interactor = TableViewInteractor()
        presenter = TableViewPresenter(interactor: interactor)
        subscribeObservables()
        presenter?.viewLoaded()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: .main), forCellReuseIdentifier: "TableViewCell")
    }
    
    func subscribeObservables() {
        presenter?.refreshSubj.subscribe(onNext: { [weak self] _ in
            self?.tableView.reloadData()
        }).disposed(by: disposeBag)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell, let cellData = presenter?.getCellData(for: indexPath) else { return UITableViewCell() }
        cell.configure(imageUrl: cellData.artworkUrl100 ?? "", artist: cellData.artistName ?? "" , collection: cellData.collectionName ?? "", country: cellData.country ?? "", description: cellData.description ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfCells() ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

