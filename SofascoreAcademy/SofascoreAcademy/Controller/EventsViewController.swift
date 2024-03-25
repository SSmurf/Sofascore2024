//
//  EventsViewController.swift
//  SofascoreAcademy
//
//  Created by Anton Pomper on 21.03.2024..
//

import UIKit

class EventsViewController: UIViewController, UICollectionViewDataSource {
    var collectionView: UICollectionView!
    var eventViewModels = [EventViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: 56)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: "EventCell")
        
        view.addSubview(collectionView)
        
        populateEventViewModels()
    }
    
    func populateEventViewModels() {
        eventViewModels.removeAll()

        for _ in 1...10 {
            let newEventViewModels = mockEvents.map { EventViewModel(event: $0) }
            eventViewModels.append(contentsOf: newEventViewModels)
        }
        
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCell", for: indexPath) as? EventCollectionViewCell else {
            fatalError("Unable to dequeue EventCollectionViewCell")
        }
        
        let viewModel = eventViewModels[indexPath.row]
        cell.configure(with: viewModel)
        
        return cell
    }
}
