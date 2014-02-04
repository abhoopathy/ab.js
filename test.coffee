ab = require('./ab.coffee')
_ = require('underscore')

_round = (n) ->
    rounded = Math.round( n * 10 ) / 10
    rounded.toFixed(1)
    #parseFloat number.toFixed(2)

trials = 10000000
_try = (arr) ->
    raw = _.map [1..trials], ->
        ab.set(arr)

    return _.map(
        _.countBy(raw, _.identity),
        (v,k) ->
            value: k
            count: v
            percentage: _round(v/trials*100)+'%'
    )


#console.log _try [
        #{
            #value: 'white'
            #share: (100/3)
        #},
        #{
            #value: 'green'
            #share: (100/3)
        #},
        #{
            #value: 'black'
            #share: (100/3)
        #}
    #]

ab.register = (obj) -> console.log obj

ab.set [
        {
            value: 'white'
            share: (100/3)
            register: 'w'
        },
        {
            value: 'green'
            share: (100/3)
            register: 'g'
        },
        {
            value: 'black'
            share: (100/3)
        }
    ], 'reg'
