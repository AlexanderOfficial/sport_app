//
//  CalendarView.swift
//  MyFirstApp_1
//
//  Created by Александр  Крайнев on 04.10.2022.
//

import UIKit

class CalendarView: UIView {
    private let collectionView222: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 3
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
       // collectionView.backgroundColor = .red
        return collectionView
    }()
    
    private let idCalendarCell = "idCalendarCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
        setDelegates()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.backgroundColor = .specialGreen
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView222)
        collectionView222.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: idCalendarCell)
    }
    
    private func setDelegates(){
        collectionView222.dataSource = self
        collectionView222.delegate = self
    }
}
//MARK: - UICollectionViewDataSource
extension CalendarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath) as! CalendarCollectionViewCell
        //ячейка должна быть как.... класс CalendarCollectionViewCell
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath) as? CalendarCollectionViewCell else {
            return UICollectionViewCell()
        }
        //cell.backgroundColor = .black
        return cell
    }
    
    
}

//MARK: - UICollectionViewDelegate
extension CalendarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension CalendarView: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/8,
               height: collectionView.frame.height)
        
    }
}

//MARK: - Set Constaraints
extension CalendarView{
    private func setConstraints(){
        NSLayoutConstraint.activate([
            collectionView222.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            collectionView222.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105),
            collectionView222.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            collectionView222.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
        
    }
}
