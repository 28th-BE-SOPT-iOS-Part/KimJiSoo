//
//  NetworkResult.swift
//  First Assignment
//
//  Created by 김지수 on 2021/05/12.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
// 로그인 뷰컨 보여줄래?
