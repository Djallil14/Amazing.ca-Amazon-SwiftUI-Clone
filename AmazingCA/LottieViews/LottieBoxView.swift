//
//  LottieBoxView.swift
//  Amazing.ca
//
//  Created by Djallil Elkebir on 2021-04-29.
//

import SwiftUI
import Lottie

struct LottieBoxView: UIViewRepresentable {
    
    var animationView = AnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieBoxView>) -> UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = Animation.named("3dbox")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([ animationView.heightAnchor.constraint(equalTo: view.heightAnchor), animationView.widthAnchor.constraint(equalTo: view.widthAnchor)])
        return view
    }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieBoxView>) {
        
    }
}
