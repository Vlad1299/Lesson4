//
//  ViewController.swift
//  Lesson4
//
//  Created by Игнат Гончаров on 31.07.2025.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        setupSlider()
        setupMainLabel()
    }
    
    // MARK: - IBActions
    @IBAction func sigmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segmen is seleced"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segmen is seleced"
            mainLabel.textColor = .blue
        default:
            mainLabel.text = "The third segmen is seleced"
            mainLabel.textColor = .yellow
        }
    }
    
    @IBAction func sliderAction() {
        mainLabel.text = slider.value.formatted()
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
    }
    
    @IBAction func doneButtonPassed() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(withtTitle: "Text field is empty", andMessage: "Please enter your name")
            return
        }
        
        if let _ = Double(inputText) {
            showAlert(withtTitle: "Wrong alert", andMessage: "Please enter your name")
            return
        }
        
        mainLabel.text = textField.text
    }
     
    @IBAction func datePickerAction() {
        mainLabel.text = datePicker.date.formatted(date: .long, time: .omitted)
    }
    
    // MARK: - Private Methods
    private func setupMainLabel() {
        mainLabel.text = slider.value.formatted()
        mainLabel.font = UIFont.systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
    }
    
    private func setupSlider() {
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
    }
}

// MARK: - UIAlertController
extension ViewController {
    private func showAlert(withtTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


