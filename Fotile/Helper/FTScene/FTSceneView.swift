//
//  FTScene.swift
//  Fotile
//
//  Created by Chausson on 2017/11/23.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit
import SceneKit

class FTSceneView:SCNView{
    let mainScene:SCNScene? = SCNScene(named: "art.scnassets/scene01.dae")
    let camerNode = SCNNode()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    override init(frame: CGRect, options: [String : Any]? = nil) {
        super.init(frame: frame, options: options)
        setup()

    }
    func setup() {
        self.backgroundColor = UIColor.white
        self.allowsCameraControl = true
        self.autoenablesDefaultLighting = true
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 100, 0)
//        mainScene?.rootNode.addChildNode(cameraNode)
    
        self.scene = mainScene


    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

