//
//  ViewController.swift
//  DZScrollView
//
//  Created by Admin on 6.09.22.
//

import UIKit

class ViewController: UIViewController {
    
     var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 16
        return stack
    }()
    
    var textFields: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
     var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 300)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addSubview(textFields)
        
        setupViewsConstraints()
        setupTextFields()
        
        
    }
}

extension ViewController {
    func setupViewsConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        ])
        
        for view in stackView.arrangedSubviews {
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: 300),
                view.heightAnchor.constraint(equalToConstant: 100)
            ])
        }
    }
    
    func setupTextFields() {
        for textField in 0..<16 {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Enter your message"
            textField.borderStyle = .roundedRect
            stackView.addArrangedSubview(textField)
        }
    }
}
