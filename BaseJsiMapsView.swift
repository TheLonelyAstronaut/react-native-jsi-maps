//
//  BaseJsiMapsView.swift
//  react-native-jsi-maps
//
//  Created by Lonely Astronaut on 3.01.23.
//

import Foundation
import UIKit

typealias Callback = @convention(block) () -> Void

@objc(BaseJsiMapsView)
@objcMembers class BaseJsiMapsView: UIView {
    var emitEvent: Selector? = nil
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let emitter = self.emitEvent {
            self.superview?.perform(emitter)
        }
    }
}
