//
//  RetryView.swift
//  EmptyView_RetryView
//
//  Created by 도학태 on 2023/04/21.
//

import Foundation
import RxSwift
import RxCocoa
import RxGesture
import Then
import SnapKit
import UIKit



class RetryView : UIView {
    let disposeBag = DisposeBag()
    
    
    static let EXIST = 1
    
    let titleLabel = UILabel()
    
    let button = UILabel().then {
        $0.textColor = .purple
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override var intrinsicContentSize: CGSize {
        let titleSize = titleLabel.intrinsicContentSize
        let buttonSize = button.intrinsicContentSize
        let width = min(titleSize.width, buttonSize.width)
        let height = titleSize.height + 16 + buttonSize.height
        return CGSize(width: width, height: height)
    }
    
    
    func show() {
        let alreadyAdded = rootViewController?.view.subviews.contains(where: { $0.tag == RetryView.EXIST }) ?? false
        guard !alreadyAdded else { return }
        rootViewController?.view.addSubview(self)
        self.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func bind() {
        
        button.rx.tapGesture()
            .when(.recognized)
            .bind(onNext : { [weak self] _ in
                guard let self = self else { return }
                print("HEllo.....")
                self.removeFromSuperview()  
            })
            .disposed(by: disposeBag)
    }
    
    
    private func configure(
        _ title : String,
        _ buttonText : String
    ) {
        titleLabel.text = title
        button.text = buttonText
        
        
        /*
         tag 설정
         */
        self.tag = RetryView.EXIST
        /*
         frame 설정
         */
        self.frame = CGRect(origin: .zero, size: intrinsicContentSize)
    }
    
    
    private func layout() {
        [
            titleLabel,
            button
        ].forEach {
            addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        
        button.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.centerX.equalTo(titleLabel)
        }
    }
    
    class Builder {
        var title : String = ""
        var buttoText : String = ""
    
        
        func setTitle(_ title : String) -> Self {
            self.title = title
            return self
        }
        
        
        func setButtonText(_ text : String) -> Self {
            self.buttoText = text
            return self
        }
        
        
        func build() -> RetryView {
            return RetryView().then {
                $0.configure(
                    title,
                    buttoText
                )
            }
        }
        
        
    }
    
}
