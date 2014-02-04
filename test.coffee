_ = require('underscore')
ab = require('./ab.coffee')

_round = (n) ->
    rounded = Math.round( n * 10 ) / 10
    rounded.toFixed(1)
    #parseFloat number.toFixed(2)


trials = 100000
raw = _.map [1..trials], ->
    ab.set [
        {
            value: 'white'
            share: 30
        },
        {
            value: 'green'
            share: 30
        },
        {
            value: 'black'
            share: 40
        }
    ]


output = _.map(
    _.countBy(raw, _.identity),
    (v,k) ->
        value: k
        count: v
        percentage: _round(v/trials*100)+'%'
)
console.log output
