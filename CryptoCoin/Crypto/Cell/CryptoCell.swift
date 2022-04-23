//
//  CryptoCell.swift
//  CryptoCoin
//
//  Created by mogggiii on 21.04.2022.
//

import UIKit

class CryptoCell: UITableViewCell {
	
	var cellViewModel: CryptoViewModel.Cell? {
		didSet {
			guard let cellViewModel = cellViewModel else { return }
			let price = Float(cellViewModel.price)
			
			coinPreviewLabel.text = cellViewModel.symbol
			coinSymbolLabel.text = cellViewModel.symbol
			coinShowNameLabel.text = cellViewModel.name
			coinPriceLabel.text = String(format: "%.2f", price ?? 0.0) + "$"
			
			if cellViewModel.delta24H.contains("-") {
				deltaLabel.text = "\(cellViewModel.delta24H)%"
				deltaLabel.textColor = .red
			} else {
				deltaLabel.text = "+\(cellViewModel.delta24H)%"
				deltaLabel.textColor = .green
			}
		}
	}
	
	// MARK: - UI Components
	fileprivate let coinPreviewLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 18, weight: .bold)
		label.backgroundColor = UIColor(red: 11 / 255, green: 132 / 255, blue: 255 / 255, alpha: 0.75)
		label.layer.cornerRadius = 60 / 2
		label.layer.masksToBounds = true
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}()
	
	fileprivate let coinSymbolLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 18, weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	fileprivate let coinShowNameLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 17, weight: .light)
		label.textColor = .gray
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	fileprivate let coinPriceLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 18, weight: .bold)
		return label
	}()
	
	fileprivate let deltaLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 15, weight: .regular)
		return label
	}()
	
	// MARK: - Init
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configureCell()
	}
	
	required init? (coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Fileprivate Methods
	fileprivate func configureCell() {
		let symbolPriceStackView = createStackView(views: [coinSymbolLabel, coinPriceLabel], axis: .horizontal)
		let coinNameDeltaStackView = createStackView(views: [coinShowNameLabel, deltaLabel], axis: .horizontal)
		
		[symbolPriceStackView, coinNameDeltaStackView, coinPreviewLabel].forEach { view in
			contentView.addSubview(view)
		}
		
		NSLayoutConstraint.activate([
			coinPreviewLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
			coinPreviewLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
			coinPreviewLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
			coinPreviewLabel.heightAnchor.constraint(equalToConstant: 60),
			coinPreviewLabel.widthAnchor.constraint(equalToConstant: 60),
	
			symbolPriceStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
			symbolPriceStackView.leadingAnchor.constraint(equalTo: coinPreviewLabel.trailingAnchor, constant: 16),
			symbolPriceStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
			
			coinNameDeltaStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
			coinNameDeltaStackView.leadingAnchor.constraint(equalTo: coinPreviewLabel.trailingAnchor, constant: 16),
			coinNameDeltaStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
			
		])
		
	}
	
	fileprivate func createStackView(views: [UIView], axis: NSLayoutConstraint.Axis) -> UIStackView {
		let stackView = UIStackView(arrangedSubviews: views)
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = axis
		stackView.distribution = .equalCentering
		return stackView
	}
}
