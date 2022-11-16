//
//  WorkoutTableViewCell.swift
//  MyFirstApp_1
//
//  Created by Александр  Крайнев on 11.10.2022.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell{
    
    private let backgroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBackground
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let workoutBackgroundView: UIView =  {
        let view = UIView()
        view.backgroundColor = .specialBackground
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let workoutImageView: UIView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "testWorkout")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .black
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return imageView
    }()
    
    private let workoutNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .specialBlack
        label.text = "Pull ups"
        label.font = .robotoMedium22()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let workoutRepsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .specialGray
        label.text = "Reps: 10"
        label.font = .robotoMedium16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let workoutSetsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .specialGray
        label.text = "Sets: 10"
        label.font = .robotoMedium16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var  startButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("START", for: .normal)
        button.backgroundColor = .specialYellow
        button.tintColor = .specialDarkGreen
        button.titleLabel?.font = .robotoBold16()
        
        button.translatesAutoresizingMaskIntoConstraints  = false
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
            
        
        return button
        
    }()
    @objc private func startButtonTapped(){
        print("TUP START")
    }
    
    
    var labelsSrackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView(){
       // view.addSubview(backgroundCell)
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(backgroundCell)
        addSubview(workoutBackgroundView)
        workoutBackgroundView.addSubview(workoutImageView)
        addSubview(workoutNameLabel)
        
        
        
        labelsSrackView = UIStackView(arrangedSubviews: [
            workoutRepsLabel,workoutSetsLabel], axis: .horizontal, spacing:10)
        
        addSubview(labelsSrackView)
        contentView.addSubview(startButton)
    }
}

extension WorkoutTableViewCell{
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
        backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
        backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        
        workoutBackgroundView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
        workoutBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        workoutBackgroundView.heightAnchor.constraint(equalToConstant: 70),
        workoutBackgroundView.widthAnchor.constraint(equalToConstant: 70),
        
     
        
        workoutImageView.topAnchor.constraint(equalTo: workoutBackgroundView.topAnchor, constant: 10),
        workoutImageView.leadingAnchor.constraint(equalTo: workoutBackgroundView.leadingAnchor, constant: 10),
        workoutImageView.trailingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: -10),
        workoutImageView.bottomAnchor.constraint(equalTo: workoutBackgroundView.bottomAnchor, constant: -10),
        
        workoutNameLabel.leadingAnchor.constraint(equalTo: workoutImageView.trailingAnchor, constant: 10),
        workoutNameLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 10),
        workoutNameLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
        
        labelsSrackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 0),
        labelsSrackView.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
        labelsSrackView.heightAnchor.constraint(equalToConstant: 20),
        
        startButton.topAnchor.constraint(equalTo: labelsSrackView.bottomAnchor, constant: 5),
        startButton.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
        startButton.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
        startButton.heightAnchor.constraint(equalToConstant: 30)
        
        
            ])
    }
}
