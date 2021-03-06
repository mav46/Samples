/*
 * Copyright (C) 2015 - 2018, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.com>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *	*	Redistributions of source code must retain the above copyright notice, this
 *		list of conditions and the following disclaimer.
 *
 *	*	Redistributions in binary form must reproduce the above copyright notice,
 *		this list of conditions and the following disclaimer in the documentation
 *		and/or other materials provided with the distribution.
 *
 *	*	Neither the name of CosmicMind nor the names of its
 *		contributors may be used to endorse or promote products derived from
 *		this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit
import Material
import Motion

class ViewController: UIViewController {
  fileprivate var animatedView = UIView()
  fileprivate var button = UIButton()
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    prepareView()
    prepareAnimatedView()
    prepareButton()
  }
}

fileprivate extension ViewController {
  @objc
  func handleButton() {
    animateBackgroundColor()
//    animateBorderColor()
//    animateCornerRadius()
//    animateDepth()
//    animateFade()
//    animatePosition()
//    animateRotate()
//    animateScale()
//    animateSize()
//    animateSpin()
//    animateSpring()
//    animateTranslate()
  }
}

fileprivate extension ViewController {
  func prepareView() {
    view.backgroundColor = .white
  }
  
  func prepareAnimatedView() {
    animatedView.backgroundColor = Color.deepPurple.base
    view.layout(animatedView).center().width(100).height(100)
  }
  
  func prepareButton() {
    view.layout(button).edges()
    button.backgroundColor = .clear
    button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
  }
}

fileprivate extension ViewController {
  func animateBackgroundColor() {
    animatedView.shapePreset = .circle
    
    animatedView.animate(.delay(1),
                         .duration(0.5),
                         .background(color: Color.cyan.base),
                         .completion({ [weak self] in
                          
                          self?.animatedView.animate(.delay(1),
                                                     .duration(0.5),
                                                     .background(color: Color.deepPurple.base))
                         }))
  }
  
  func animateBorderColor() {
    animatedView.shapePreset = .circle
    animatedView.borderWidthPreset = .border3
    animatedView.borderColor = Color.deepPurple.base
    
    animatedView.animate([.delay(1),
                          .duration(0.5),
                          .border(color: Color.cyan.base),
                          .border(width: BorderWidthPreset.border9.cgFloatValue * 2)]) { [weak self] in
                            
                            self?.animatedView.animate(.delay(1),
                                                       .duration(0.5),
                                                       .border(color: Color.deepPurple.base),
                                                       .border(width: BorderWidthPreset.border3.cgFloatValue))
    }
  }
  
  func animateCornerRadius() {
    animatedView.animate(.delay(1),
                         .duration(0.5),
                         .corner(radius: 50),
                         .background(color: Color.cyan.base),
                         .completion({ [weak self] in
                          
                          self?.animatedView.animate(.delay(1),
                                                     .duration(0.5),
                                                     .corner(radius: 0),
                                                     .background(color: Color.deepPurple.base))
                         }))
  }
  
  func animateDepth() {
    animatedView.shapePreset = .circle
    animatedView.depthPreset = .depth5
    
    animatedView.animate(.delay(1),
                         .duration(0.5),
                         .depth(.none),
                         .background(color: Color.cyan.base),
                         .completion({ [weak self] in
                          
                          self?.animatedView.animate(.delay(1),
                                                     .duration(0.5),
                                                     .depth(.depth5),
                                                     .background(color: Color.deepPurple.base))
                         }))
    
  }
  
  func animateFade() {
    animatedView.shapePreset = .circle
    
    animatedView.animate([.delay(1),
                          .duration(0.5),
                          .fadeOut,
                          .background(color: Color.cyan.base)]) { [weak self] in
                            
                            self?.animatedView.animate(.delay(1), .duration(0.5), .fadeIn, .background(color: Color.deepPurple.base))
    }
  }
  
  func animatePosition() {
    animatedView.shapePreset = .circle
    
    animatedView.animate(.delay(1),
                         .duration(0.5),
                         .position(CGPoint(x: 200, y: 200)),
                         .background(color: Color.cyan.base),
                         .completion({ [weak self, point = view.center] in
                          
                          self?.animatedView.animate(.delay(1),
                                                     .duration(0.5),
                                                     .position(point),
                                                     .background(color: Color.deepPurple.base))
                         }))
  }
  
  func animateRotate() {
    animatedView.animate(.delay(1),
                         .duration(0.5),
                         .rotate(180),
                         .background(color: Color.cyan.base),
                         .completion({ [weak self] in
                          
                          self?.animatedView.animate(.delay(1),
                                                     .duration(0.5),
                                                     .rotate(0),
                                                     .background(color: Color.deepPurple.base))
                         }))
  }
  
  func animateScale() {
    animatedView.shapePreset = .circle
    
    animatedView.animate(.delay(1),
                         .duration(0.5),
                         .scale(3),
                         .background(color: Color.cyan.base),
                         .completion({ [weak self] in
                          
                          self?.animatedView.animate(.delay(1),
                                                     .duration(0.5),
                                                     .scale(),
                                                     .background(color: Color.deepPurple.base))
                         }))
  }
  
  func animateSize() {
    let size = animatedView.bounds.size
    
    animatedView.animate([.delay(1),
                          .duration(0.5),
                          .size(CGSize(width: 200, height: 200)),
                          .background(color: Color.cyan.base)]) { [weak self] in
                            
                            self?.animatedView.animate(.delay(1),
                                                       .duration(0.5),
                                                       .size(size),
                                                       .background(color: Color.deepPurple.base))
    }
  }
  
  func animateSpin() {
    animatedView.animate([.delay(1),
                          .duration(0.5),
                          .spin(x: 1, y: 1, z: 1),
                          .background(color: Color.cyan.base)]) { [weak self] in
                            
                            self?.animatedView.animate(.delay(1),
                                                       .duration(0.5),
                                                       .spin(-1),
                                                       .background(color: Color.deepPurple.base))
    }
  }
  
  func animateSpring() {
    let point = view.center
    
    animatedView.shapePreset = .circle
    
    animatedView.animate(.delay(1),
                         .position(CGPoint(x: 200, y: 200)),
                         .spring(stiffness: 15, damping: 2),
                         .background(color: Color.cyan.base),
                         .timingFunction(.linear),
                         .completion({ [weak self] in
                          
                          self?.animatedView.animate(.position(point),
                                                     .duration(0.5),
                                                     .background(color: Color.deepPurple.base))
                         }))
  }
  
  func animateTranslate() {
    animatedView.shapePreset = .circle
    
    animatedView.animate([.delay(1),
                          .duration(0.5),
                          .translate(x: 50, y: 100),
                          .background(color: Color.cyan.base)]) { [weak self] in
                            
                            self?.animatedView.animate(.delay(1),
                                                       .duration(0.5),
                                                       .translate(.zero),
                                                       .background(color: Color.deepPurple.base))
    }
  }
}
