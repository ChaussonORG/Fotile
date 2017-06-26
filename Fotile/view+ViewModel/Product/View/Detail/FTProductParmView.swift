//
//  FTProductParmView.swift
//  Fotile
//
//  Created by Chausson on 2017/6/26.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit
class ParmView: UIView {
    let name = UILabel()
    let content = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
   
        content.font = UIFont.systemFont(ofSize: 14)

        name.font = UIFont.systemFont(ofSize: 14)
        name.textColor = UIColor("#4D4D4D")
        content.textColor = UIColor("#373737")
        content.textAlignment = .right
        let line = UIView(frame: CGRect(x: 0, y: frame.size.height-1, width: frame.size.width, height: 1))
        line.backgroundColor = UIColor("#E7E7E7")

        addSubview(line)
        addSubview(name)
        addSubview(content)
        name.frame = CGRect(x: 0, y: 15, width: 150, height: 15)
        let size = CGSize(width: 250, height: 15)
        name.sizeThatFits(size)
        content.frame = CGRect(x: name.frame.size.width, y: 15, width: frame.size.width-name.frame.size.width-20, height: 15)
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class FTProductParmView: UIView {

    init(params:Array<FTProductParm>?) {
         let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 135)
        super.init(frame: frame)
        self.addSubview(line)
    
        guard let p =  params else{
            return
        }
        for index in 0...p.count-1 {
            let data = p[index]
            let y = CGFloat(index/2*45)
            let width = (self.frame.size.width-100)/2
            
            if index%2 == 0 {
                let view = ParmView(frame:CGRect(x: 50, y: y, width: width, height: 45))
                view.name.text = data.title
                view.content.text = data.content
                addSubview(view)
                let gap = UIView(frame:CGRect(x: width-1, y: 0, width: 1, height: 45))
                gap.backgroundColor = UIColor("#E7E7E7")
                view.addSubview(gap)
            }else{
                let view = ParmView(frame:CGRect(x: width+50, y: y, width: width, height: 45))
                view.name.text = data.title
                view.name.frame = CGRect(x: 20, y: 15, width: 150, height: 15)
                view.content.text = data.content
                addSubview(view)
            }
    
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var line:UIView = {
        let line = UIView(frame: CGRect(x: 50, y: 0, width: self.frame.size.width-100, height: 1))
        line.backgroundColor = UIColor("#E7E7E7")
        return line
    }()

}
