//
//  CryptoCell.swift
//  CryptoCoin
//
//  Created by mogggiii on 21.04.2022.
//

import UIKit

class CryptoCell: UITableViewCell {
	
	var cell: CryptoViewModel.Cell?
	
	var coinNameLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 17, weight: .medium)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	var priceLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 17, weight: .medium)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	var deltaLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 17, weight: .medium)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configureCell()
	}
	
	required init? (coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func set(viewModel: CryptoViewModel.Cell) {
		self.cell = viewModel
		coinNameLabel.text = viewModel.name
		priceLabel.text = viewModel.price
		deltaLabel.text = viewModel.delta24H
		
		if viewModel.delta24H.contains("-") {
			deltaLabel.textColor = .red
		} else {
			deltaLabel.textColor = .green
		}
	}
	
	fileprivate func configureCell() {
		let stackView = UIStackView(arrangedSubviews: [
			coinNameLabel,
			priceLabel,
			deltaLabel
		])
		
		stackView.axis = .horizontal
		stackView.spacing = 15
		stackView.distribution = .fillEqually
		stackView.translatesAutoresizingMaskIntoConstraints = false
		
		contentView.addSubview(stackView)
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
			stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
			stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
			stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
		])
		
	}
	
}
