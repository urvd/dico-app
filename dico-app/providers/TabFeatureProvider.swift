//
//  TabFeatureProvider.swift
//  dico-app
//
//  Created by vido on 03/07/2020.
//  Copyright © 2020 vido. All rights reserved.
//

import Foundation

class ResponseResults{
    init(s:ResponseData<Synonyme>, a:ResponseData<Antonyme> ,e:ResponseData<Expression>) {
        synolist = s
        antolist = a
        exprlist = e
    }
    //var deflist:[Definition:Bool]
    var synolist:ResponseData<Synonyme>
    var antolist:ResponseData<Antonyme>
    var exprlist:ResponseData<Expression>
}

