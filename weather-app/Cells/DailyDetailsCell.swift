//
//  DailyDetailsCell.swift
//  weather-app
//
//  Created by Christelle Nieves on 9/11/21.
//

import UIKit

class DailyDetailsCell: UITableViewCell {
    
    let dateLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDateLabel() {
        contentView.addSubview(dateLabel)
        
        // Appearance
        dateLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        dateLabel.textColor = UIColor.white.withAlphaComponent(0.80)
        
        // Constraints
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:15)
        ])
    }
}

// MARK: - Auxiliary Functions

extension DailyDetailsCell {
    func setupCellWithData(data: DailyData, day: String) {
        dateLabel.text = String(day.prefix(3))
    }
}
