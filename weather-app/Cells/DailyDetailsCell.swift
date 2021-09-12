//
//  DailyDetailsCell.swift
//  weather-app
//
//  Created by Christelle Nieves on 9/11/21.
//

import UIKit

class DailyDetailsCell: UITableViewCell {
    
    let dateLabel = UILabel()
    let weatherImageView = UIImageView()
    let highLabel = UILabel()
    let lowLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupDateLabel()
        setupImageView()
        setupLowLabel()
        setupHighLabel()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        weatherImageView.image = nil
        dateLabel.text = ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDateLabel() {
        contentView.addSubview(dateLabel)
        
        // Appearance
        dateLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        dateLabel.textColor = UIColor.white
        
        // Constraints
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/5)
        ])
    }
    
    private func setupImageView() {
        contentView.addSubview(weatherImageView)
        
        // Appearance
        weatherImageView.contentMode = .scaleAspectFit
        
        // Constraints
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            weatherImageView.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 20),
            weatherImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.90),
            weatherImageView.widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    private func setupHighLabel() {
        contentView.addSubview(highLabel)
        
        // Appearance
        highLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        highLabel.textColor = UIColor.white
        
        // Constraints
        highLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            highLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            highLabel.trailingAnchor.constraint(equalTo: lowLabel.leadingAnchor, constant: -20),
            highLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/5)
        ])
    }
    
    private func setupLowLabel() {
        contentView.addSubview(lowLabel)
        
        // Appearance
        lowLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        lowLabel.textColor = UIColor.white.withAlphaComponent(0.70)
        
        // Constraints
        lowLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lowLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            lowLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lowLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/5)
        ])
    }
}

// MARK: - Auxiliary Functions

extension DailyDetailsCell {
    func setupCellWithData(data: DailyData, day: String, image: UIImage) {
        dateLabel.text = String(day.prefix(3))
        weatherImageView.image = image
        highLabel.text = "High: \(Int(data.temp.max))"
        lowLabel.text = "Low: \(Int(data.temp.min))"
    }
}
