//
//  TextViewCell.swift
//  TextViewInTable
//
//  Created by hiraoka on 2021/07/30.
//

import UIKit

class TextViewCell: UITableViewCell {

    static var reuseIdentifier: String { String(describing: self) }

    var thumbnailView: UIImageView?
    var textView: UITextView?
    var readLabel: UILabel?
    var dateLabel: UILabel?

    private var spacing: CGFloat { UIFont.systemFontSize * 0.8 }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        var constrains = [NSLayoutConstraint]()

        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .bottom
        stackView.distribution = .fill
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        constrains += [
            stackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ]
        contentView.addSubview(stackView)

        let thumbnailView = UIImageView()
        thumbnailView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailView.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(thumbnailView)
        constrains += [
            thumbnailView.heightAnchor.constraint(equalToConstant: 30),
            thumbnailView.widthAnchor.constraint(equalToConstant: 30)
        ]
        self.thumbnailView = thumbnailView

        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        stackView.addArrangedSubview(textView)
        constrains += [
            textView.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ]
        self.textView = textView

        let optionInfoStackView = UIStackView()
        optionInfoStackView.axis = .vertical
        optionInfoStackView.spacing = spacing
        constrains += [
            optionInfoStackView.widthAnchor.constraint(equalToConstant: 80)
        ]
        stackView.addArrangedSubview(optionInfoStackView)

        let readLabel = UILabel()
        readLabel.font = UIFont.systemFont(ofSize: 10)
        optionInfoStackView.addArrangedSubview(readLabel)
        self.readLabel = readLabel

        let dateLabel = UILabel()
        dateLabel.font = UIFont.systemFont(ofSize: 10)
        optionInfoStackView.addArrangedSubview(dateLabel)
        self.dateLabel = dateLabel

        NSLayoutConstraint.activate(constrains)

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
