# Analytics set var
# [{share: '10', value: hello},{}]

root = this;

ab = {}

# [
#   {
#       share: 50
#       value: 50
#   }
# ]
ab.set = (options) ->

    # Random num between 1 and 100
    rand = Math.floor((Math.random()*100)+1)

    sum = 0
    for opt in options
        sum = sum + opt.share
        if rand <= sum
            _register opt if opt.register?
            return opt.value


_register = (opt) ->
    registerProperty = opt.register

    if ab.register?

        regObj = {}

        #if isString
        if (typeof registerProperty == 'string')
            regObj[registerProperty] = opt.value

        #if isObject
        else if (registerProperty == Object(registerProperty))
            regObj = registerProperty

        ab.register(regObj)


if ( typeof define == "function" && define.amd )
    define "ab", [], -> ab


if module?.exports?
    module.exports = ab
