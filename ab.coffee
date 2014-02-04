# Analytics set var
# [{share: '10', value: hello},{}]


root = this;

ab = {}


ab.set = (options) ->

    # Random num between 1 and 100
    rand = Math.floor((Math.random()*100)+1)

    sum = 0
    for opt in options
        sum = sum + opt.share
        if rand <= sum
            return opt.value


if ( typeof define == "function" && define.amd )
    define "ab", [], -> ab

if module?.exports?
    module.exports = ab
