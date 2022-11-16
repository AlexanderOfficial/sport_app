//
//  NewWorkoutViewController.swift
//  MyFirstApp_1
//
//  Created by Александр  Крайнев on 18.10.2022.
//

import UIKit

//
//  StatisticsViewController.swift
//  MyFirstApp_1
//
//  Created by Александр  Крайнев on 12.10.2022.
//

import UIKit

class NewWorkoutViewController: UIViewController{
    private let newWorkoutLabel =  UILabel(text: "NEW WORKOUT",
                                           font: .robotoMedium24(),
                                           textColor: .specialGray)
    
    
    private lazy var closeButton = CloseButton(type: .system)

    
    private let nameView = NameView()
    
    private var stackView = UIStackView()
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()
    
    private lazy var saveButton = GreenButton(text: "SAVE")
//  /
    
//    private let testSwitch: UISwitch = {
//        let testSwitch = UISwitch()
//        testSwitch.isOn = true
//        testSwitch.onTintColor = .specialGreen
//        //testSwitch.addTarget(self, action: #selector(TestTest), for: .valueChanged)
//        testSwitch.translatesAutoresizingMaskIntoConstraints = false
//        return testSwitch
//    }()
    
//    private lazy var testSlider: UISlider = {
//        let slider = UISlider()
//        slider.minimumValue = 0
//
//        slider.maximumValue = 10
//        slider.maximumTrackTintColor = .specialLightBrown
//        slider.minimumTrackTintColor = .specialGreen
//        slider.translatesAutoresizingMaskIntoConstraints = false
//        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
//
//        return slider
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .none
        setupViews()
        setConstraints()
        
    }
    
   

    private func setupViews(){
        view.backgroundColor = .specialBackground
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        stackView = UIStackView(arrangedSubviews: [nameView,
                                                   dateAndRepeatView,
                                                   repsOrTimerView], axis: .vertical, spacing: 20)
        view.addSubview(stackView)
        view.addSubview(saveButton)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }

    @objc private func closeButtonTapped(){
        print("tapped")
        dismiss(animated: true) //закрываем экран и выгружаем из памяти
        
    }
    
    
    @objc private func saveButtonTapped() {
        print("save")
    }
//    @objc private func sliderChanged(){
//        print(testSlider.value)
//    }
    
}



//MARK: StatisticsViewController/setConstraints
extension NewWorkoutViewController{
    private func setConstraints(){
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            nameView.heightAnchor.constraint(equalToConstant: 60),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 115),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 340),

            stackView.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}

