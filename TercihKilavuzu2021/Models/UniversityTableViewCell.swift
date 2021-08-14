//
//  UniversityTableViewCell.swift
//  TercihKilavuzu2021
//
//  Created by İsmail on 4.08.2021.
//

import UIKit

protocol UniversityTableViewCellDelegate {
    func universityTableViewCell(_ cell: UniversityTableViewCell, didTapWith viewModel: UniversityViewModel)
}

class UniversityTableViewCell: UITableViewCell {
    
    var delegate: UniversityTableViewCellDelegate?

//    private var viewModel: UniversityViewModel?
    
    var universityViewModel: UniversityViewModel! {
        didSet {
            
            universityNameLabel.text = universityViewModel.name
            departmentLabel.text = universityViewModel.department
            minScoreValueLabel.text = universityViewModel.minScore
            placeMentValueLabel.text = universityViewModel.placement
            quotaValueLabel.text = universityViewModel.quaota
            
            if universityViewModel.isFavorite {
                favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//                favoriteButton.setTitle("Defav", for: .normal)
//                favoriteButton.setTitleColor(.red, for: .normal)
            }
            else {
                favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
//                favoriteButton.setTitle("Fav", for: .normal)
//                favoriteButton.setTitleColor(.blue, for: .normal)
            }
        }
    }
    
    private let universityNameLabel : UILabel = {
        let label = UILabel()
       
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    
    private let departmentLabel : UILabel = {
        let label = UILabel()
       
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    private let minScoreTitleLabel : UILabel = {
        let label = UILabel()
       
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "Taban Puanı"
        
        return label
    }()
    
    private let minScoreValueLabel : UILabel = {
        let label = UILabel()
       
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 12)
        
        return label
    }()
    
    private let placeMentTitleLabel : UILabel = {
        let label = UILabel()
       
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "Sıralama"
        
        return label
    }()
    
    private let placeMentValueLabel : UILabel = {
        let label = UILabel()
       
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 12)
        
        return label
    }()
    
    private let quotaTitleLabel : UILabel = {
        let label = UILabel()
       
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "Kontenjan"
        
        return label
    }()
    
    private let quotaValueLabel : UILabel = {
        let label = UILabel()
       
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 12)
        
        return label
    }()
    
    private let favoriteIcon : UIImageView = {
        let icon = UIImageView(image: UIImage(systemName: "heart"))
        
        icon.tintColor = .systemPink
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = true
        
        return icon
    }()
    
    private let favoriteButton : UIButton = {
       let button = UIButton()
        button.tintColor = .systemPink
        let size = CGSize(width: 40, height: 40)
        let inset = UIEdgeInsets(top: (button.frame.size.height - size.height) / 2,
                                 left: (button.frame.size.width - size.width) / 2,
                                 bottom: (button.frame.size.height - size.height) / 2,
                                 right: (button.frame.size.width - size.width) / 2)
        button.imageEdgeInsets = inset

        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(universityNameLabel)
        addSubview(departmentLabel)
//        addSubview(minScoreTitleLabel)
//        addSubview(minScoreValueLabel)
//        addSubview(placeMentTitleLabel)
//        addSubview(placeMentValueLabel)
//        addSubview(quotaTitleLabel)
//        addSubview(quotaValueLabel)
//        addSubview(favoriteIcon)
        contentView.addSubview(favoriteButton)
        
        favoriteButton.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        
        
    }
    
    override func layoutSubviews() {
//        favoriteButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)

        universityNameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: frame.size.width - 10 - favoriteButton.frame.size.width, height: 20, enableInsets: false)
        departmentLabel.anchor(top: universityNameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: frame.size.width - 10 - favoriteButton.frame.size.width, height: 20, enableInsets: false)
        favoriteButton.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor , paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 40, height: 40, enableInsets: false)
        
//        let stackView1 = UIStackView(arrangedSubviews: [minScoreTitleLabel, placeMentTitleLabel, quotaTitleLabel])
//        stackView1.distribution = .equalSpacing
//        stackView1.axis = .horizontal
//        stackView1.spacing = 5
//        stackView1.alignment = .center
//        addSubview(stackView1)

//        let stackView2 = UIStackView(arrangedSubviews: [minScoreValueLabel, placeMentValueLabel, quotaValueLabel])
//        stackView2.distribution = .equalSpacing
//        stackView2.axis = .horizontal
//        stackView2.spacing = 5
//        stackView2.alignment = .center
//        addSubview(stackView2)
        
//        stackView1.anchor(top: departmentLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: frame.size.width - 50, height: 50, enableInsets: false)
//        stackView2.anchor(top: stackView1.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: frame.size.width - 50 , height: 50, enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapFavoriteButton() {
        guard let viewModel = universityViewModel else {
            return
        }
        var newViewModel = viewModel
        
        print("button tapped")
        
        newViewModel.isFavorite = !viewModel.isFavorite
        
        delegate?.universityTableViewCell(self, didTapWith: newViewModel)
        
        prepareForReuse()
//        configure(with: newViewModel)
        configure(with: newViewModel)
        
    }
    
    // Set text of views from viewModel
    func configure(with viewModel: UniversityViewModel) {
        self.universityViewModel = viewModel

//        universityNameLabel.text = viewModel.name
//        departmentLabel.text = viewModel.department
//        minScoreValueLabel.text = viewModel.minScore
//        placeMentValueLabel.text = viewModel.placement
        //        quotaValueLabel.text = viewModel.quaota
        
        if viewModel.isFavorite {
                            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//            favoriteButton.setTitle("Defav", for: .normal)
//            favoriteButton.setTitleColor(.red, for: .normal)
        }
        else {
                            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
//            favoriteButton.setTitle("Fav", for: .normal)
//            favoriteButton.setTitleColor(.blue, for: .normal)
            
            
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        universityNameLabel.text = nil
        departmentLabel.text = nil
        minScoreValueLabel.text = nil
        placeMentValueLabel.text = nil
        quotaValueLabel.text = nil
//        favoriteIcon.image = nil
        favoriteButton.setImage(nil, for: .normal)
    }
    
}
