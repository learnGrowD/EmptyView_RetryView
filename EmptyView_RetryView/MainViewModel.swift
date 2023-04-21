//
//  MainViewModel.swift
//  EmptyView_RetryView
//
//  Created by 도학태 on 2023/04/21.
//

import Foundation
import RxSwift
import RxCocoa


struct MainViewModel {
    
    func create() -> Observable<String> {
        return Observable.just("Retry가 될까 고민이 된다.")
    }
    
}
