//
//  DrawView.swift
//  TouchTracker
//
//  Created by Go7hic on 2019/12/12.
//  Copyright © 2019 Go7hic. All rights reserved.
//

import UIKit
class DrawView: UIView {
    var currentLine: Line?
    var finshedLine = [Line]()
    
    func strokeLine(line: Line) {
        let path = UIBezierPath()
        path.lineWidth = 10
        path.lineCapStyle = .round
        path.move(to: line.begin)
        path.addLine(to: line.end)
        
        path.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.black.setStroke()
        for line in finshedLine {
            strokeLine(line: line)
        }
        if let line = currentLine {
            UIColor.red.setStroke()
            strokeLine(line: line)
        }
    }
}
