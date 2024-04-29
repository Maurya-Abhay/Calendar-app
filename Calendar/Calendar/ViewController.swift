//
//  ViewController.swift
//  Calendar
//
//  Created by STUDENT on 4/22/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createCalendar()
    }
    
    func  createCalendar(){
        view.backgroundColor = .systemBlue
        let calendarView = UICalendarView()
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        
        calendarView.calendar = .current
        calendarView.locale = .current
        calendarView.fontDesign = .rounded
        calendarView.delegate = self
        calendarView.layer.cornerRadius = 12
        calendarView.backgroundColor = .systemBackground
        calendarView.availableDateRange = DateInterval.init(start: Date.now, end: Date.distantFuture)
        calendarView.backgroundColor = .secondarySystemBackground
        calendarView.layer.cornerCurve = .continuous
        
        
        view.addSubview(calendarView)
        
        view.addSubview(calendarView)
        
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 500),
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            
        ])
    }

}


//extension ViewController: UICalendarViewDelegate {
//    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
//        return nil
//    }
    extension ViewController: UICalendarViewDelegate {
        func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            let font = UIFont.systemFont(ofSize: 10)
            let configuration = UIImage.SymbolConfiguration(font: font)
            let image = UIImage(systemName: "star.fill", withConfiguration: configuration)?.withRenderingMode(.alwaysOriginal)
            
            return .customView {
                let emoji = UILabel()
                emoji.text = "🙏"
                return emoji
            }
        }
}
