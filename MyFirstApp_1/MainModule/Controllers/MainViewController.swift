//
//  ViewController.swift
//  MyFirstApp_1
//
//  Created by Александр  Крайнев on 04.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    //уровни доступа почитать
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 5
        imageView.layer.cornerRadius = 50
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Your name"
        label.minimumScaleFactor = 0.5 //текст может сжиматься до 2 раз
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let workoutTodayLabel: UILabel = {
        let label = UILabel()
        label.text = "Workout today"
        label.textColor = .specialLightBrown
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delaysContentTouches = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func setDelegated(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private let idTableViewCell = "idTableViewCell"
    
    
    private let calendarView = CalendarView()
    private let wheatherView = WeatherView()
    
    
    private lazy var addWorkoutButton: UIButton =  {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setTitle("Add workout", for: .normal)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.tintColor = .specialDarkGreen
        button.titleLabel?.font = .robotoMedium12()
        button.imageEdgeInsets = .init(top: 0,
                                       left: 20,
                                       bottom: 15,
                                       right: 0)
        button.titleEdgeInsets = .init(top: 50,
                                       left: -40,
                                       bottom: 0,
                                       right: 0)
        button.addShadowOnView()
        button.addTarget(self, action: #selector(addWorkoutButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews() //зададим оюъекты
        setConstraints()
        setDelegated()
    }
    
    override func viewWillLayoutSubviews() {
        
    }
    private func setupViews(){
        view.backgroundColor = #colorLiteral(red: 0.9532985091, green: 0.9427116513, blue: 0.9085384011, alpha: 1)
        view.addSubview(calendarView)
        view.addSubview(userPhotoImageView)
        view.addSubview(userNameLabel)
        view.addSubview(addWorkoutButton)
        view.addSubview(wheatherView)
        view.addSubview(workoutTodayLabel)
        view.addSubview(tableView)
        tableView.register(WorkoutTableViewCell.self, forCellReuseIdentifier: idTableViewCell)
        //view.addSubview(calendarView)
    }
    
    @objc private func addWorkoutButtonTapped(){
        let newWokoutVC = NewWorkoutViewController()
        newWokoutVC.modalPresentationStyle = .fullScreen //на полный экран
        
        present(newWokoutVC, animated: true)
    }

}


// MARK: UITableViewDataSource
extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idTableViewCell, for: indexPath) as? WorkoutTableViewCell else {
            return UITableViewCell()
        }
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        15
    }
    
}

extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

//MARK: SetConstraints
extension MainViewController{
    private func setConstraints(){
        NSLayoutConstraint.activate([
            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            userPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            calendarView.topAnchor.constraint(equalTo: userPhotoImageView.centerYAnchor),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.heightAnchor.constraint(equalToConstant: 70),
            
           // userNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: <#T##CGFloat#>),
            userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor, constant: -10),
            userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor, constant: 5),
            userNameLabel.trailingAnchor.constraint(equalTo:view.trailingAnchor , constant: -10),
            
            addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addWorkoutButton.heightAnchor.constraint(equalToConstant: 80),
            addWorkoutButton.widthAnchor.constraint(equalToConstant: 80),
            
            //блок погоды
            wheatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 6),
            wheatherView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 10),
            wheatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            wheatherView.widthAnchor.constraint(equalToConstant: 270),
            wheatherView.heightAnchor.constraint(equalToConstant: 80),
            
            workoutTodayLabel.topAnchor.constraint(equalTo: addWorkoutButton.bottomAnchor, constant: 10),
            workoutTodayLabel.leadingAnchor.constraint(equalTo: addWorkoutButton.leadingAnchor, constant: 10),
            
            
            tableView.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ,
        ])
    }
}

