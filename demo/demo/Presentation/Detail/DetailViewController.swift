//
//  DetailViewController.swift
//  demo
//
//  Created by Sky on 23/01/2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    private var viewModel: DetailViewModel!
    
    static func create(with viewModel: DetailViewModel) -> DetailViewController {
        let view = DetailViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeupUI()
        
        viewModel.item.observe(on: self) { [weak self] item in
            guard let self = self, let entity = item else { return }
            self.updateView(with: entity)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    private func updateView(with entity: MainEntity) {
        itemImageView.image = #imageLiteral(resourceName: "placeholder")
        descLabel.text = entity.description
        locationLabel.text = entity.location
        titleLabel.text = entity.title
        timeLabel.text = entity.date
        if let imageUrl = entity.imageUrl, let url = URL(string: imageUrl) {
            itemImageView.load(url: url)
        }
    }
    
    private func makeupUI() {
        for item in [descLabel, locationLabel, titleLabel, timeLabel] {
            item?.textColor = .white
        }
        
        descLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        locationLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        timeLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }

    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func shareTapped(_ sender: Any) {
        let bounds = UIScreen.main.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        self.view.drawHierarchy(in: bounds, afterScreenUpdates: false)
        guard let img = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        let activityViewController = UIActivityViewController(activityItems: [img], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
}
