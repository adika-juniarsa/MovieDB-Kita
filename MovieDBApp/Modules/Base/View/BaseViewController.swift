//
//  BaseViewController.swift
//  MovieDBApp
//
//  Created by Alo-Adika on 17/03/21.
//  
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    // MARK: Properties
    
    let child = SpinnerViewController()
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var presenterBase: BaseViewToPresenterProtocol?
    var spinnerContainer: UIView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenterBase?.viewDidLoad()
    }
}

extension BaseViewController: BasePresenterToViewProtocol {
    
    @objc func rigthMenuButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func setupView() {
        navigationController?.navigationBar.barTintColor = .systemBlue
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func showSpinnerView() {
        DispatchQueue.main.async {
            self.addChild(self.child)
            self.child.view.frame = self.view.frame
            self.view.addSubview(self.child.view)
            self.child.didMove(toParent: self)
        }
    }
    
    func removeSpinnerView() {
        self.child.willMove(toParent: nil)
        self.child.view.removeFromSuperview()
        self.child.removeFromParent()
    }
    
    func removeSpinnerLoading() {
        self.activityIndicator.removeFromSuperview()
    }
    
    func showErrorMessage(_ message: String) {
        let alertDisapperTimeInSeconds = 2.0
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + alertDisapperTimeInSeconds) {
            alert.dismiss(animated: true)
        }
    }
    
    func addSpinnerInfinityScroll() {
        let mainView: UIView = view
        activityIndicator.color = .systemBlue
        activityIndicator.frame = CGRect(x: (mainView.frame.width/2), y: mainView.frame.height - 30, width: CGFloat(40), height: CGFloat(40))
    }
        
    @objc func removeEmptyStateView() {
        if let view = view as? UITableView {
            view.isScrollEnabled = true
            view.restore()
        }
    }
    
    @objc func setEmptyStateView(withMessage message: String) {
        if let view = view as? UITableView {
            view.isScrollEnabled = false
            view.setEmptyMessage(message)
        }
    }
}

extension BaseViewController {
    
    public func addNavigationBarButton(imageName:String,direction:direction){
        var image = UIImage(systemName: imageName)
        image = image?.withRenderingMode(.alwaysTemplate)
        switch direction {
        case .left:
            let item = UIBarButtonItem(image: image, style:.plain, target: nil, action: #selector(leftButtonAction))
            item.tintColor = .white
            self.navigationItem.leftBarButtonItem = item
        case .right:
            let item = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(rightButtonAction))
            item.tintColor = .white
            self.navigationItem.rightBarButtonItem = item
        }
    }
    
    @objc public func leftButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc public func rightButtonAction() {
        rigthMenuButtonAction()
    }
    
    public enum direction {
        case right
        case left
    }
}
