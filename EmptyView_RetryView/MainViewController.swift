//
//  MainViewController.swift
//  EmptyView_RetryView
//
//  Created by 도학태 on 2023/04/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SnapKit

class MainViewController : UIViewController {
    let disposeBag = DisposeBag()
    
    let button = UILabel().then {
        $0.text = "HELLO.... Retry"
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        layout()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind() {
        button.rx.tapGesture()
            .when(.recognized)
            .bind(onNext : { _ in
                RetryView.Builder()
                    .setTitle("IOS")
                    .setButtonText("재시도")
                    .build()
                    .show()
                print("HELLO.")
            })
            .disposed(by: disposeBag)
    }
    
    func layout() {
        [
            button
        ].forEach {
            view.addSubview($0)
        }
        
        button.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
    }
    
    
}
