//
//  WheatherView.swift
//  MyFirstApp_1
//
//  Created by Александр  Крайнев on 04.10.2022.
//

import UIKit

class WeatherView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let currentWeatherMessage: UILabel = {
        let currentWeatherMessage = UILabel()
        currentWeatherMessage.text = "Солнечно" // will change depending on the weather //next
        currentWeatherMessage.font = .robotoMedium18()
        currentWeatherMessage.textColor = .specialGray
        //currentWeatherMessage.font = UIFont.systemFont(ofSize: 20)
        currentWeatherMessage.translatesAutoresizingMaskIntoConstraints = false
        return currentWeatherMessage
    }()
    
    private let welcomeMesegeAboutWheather: UILabel = {
        let welcomeMesegeAboutWheather = UILabel()
        //welcomeMesegeAboutWheather.attributedText =
        welcomeMesegeAboutWheather.text = "Хорошая погода, чтобы позаниматься на улице"
        welcomeMesegeAboutWheather.font = .robotoMedium14()
        welcomeMesegeAboutWheather.textColor = .specialGray
        welcomeMesegeAboutWheather.numberOfLines = 2
        welcomeMesegeAboutWheather.adjustsFontSizeToFitWidth = true
        welcomeMesegeAboutWheather.translatesAutoresizingMaskIntoConstraints = false
        return welcomeMesegeAboutWheather
    }()
    
    private let currentWheatherPicture: UIImageView = {
        //let currentWheatherPicture = UIImageView(image: UIImage(named: "sun"))
        let currentWheatherPicture = UIImageView()
        currentWheatherPicture.image = UIImage(named: "sun")
        currentWheatherPicture.translatesAutoresizingMaskIntoConstraints = false
        return currentWheatherPicture
    }()
    
    private func setupViews(){
        self.layer.cornerRadius = 10
        //self.backgroundColor = .red
        self.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        addShadowOnView()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(currentWeatherMessage)
        self.addSubview(welcomeMesegeAboutWheather)
        self.addSubview(currentWheatherPicture)
        //translatesAutoresizingMaskIntoConstraints = false
    }
    
   
    
}

extension WeatherView{
    private func setConstraints(){
        NSLayoutConstraint.activate([
            //картиночка
            currentWheatherPicture.topAnchor.constraint(equalTo: self.topAnchor, constant: 7),
            currentWheatherPicture.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            currentWheatherPicture.heightAnchor.constraint(equalToConstant: 60),
            currentWheatherPicture.widthAnchor.constraint(equalToConstant: 60),
            //currentWheatherPicture.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -6),
            
            
            //для текущей погоды
            currentWeatherMessage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            currentWeatherMessage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11),
            currentWeatherMessage.trailingAnchor.constraint(equalTo: currentWheatherPicture.leadingAnchor, constant: -10),
            
            
            
            //сообщение о погоде
            welcomeMesegeAboutWheather.topAnchor.constraint(equalTo:currentWeatherMessage.bottomAnchor, constant: 5),
            welcomeMesegeAboutWheather.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            //welcomeMesegeAboutWheather.topAnchor.constraint(equalTo:currentWeatherMessage.bottomAnchor, constant: 1),
            welcomeMesegeAboutWheather.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            welcomeMesegeAboutWheather.trailingAnchor.constraint(equalTo: currentWheatherPicture.leadingAnchor, constant: -5)
            ])
        
    }
}
