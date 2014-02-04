ab = {}

ab.set = (options, registerKey) ->

    storedKey = _getProp(registerKey)
    for opt in options
        if (storedKey is opt.register) or
        (!opt.register? and storedKey is opt.value)
            return opt.value

    # Random num between 1 and 100
    rand = Math.floor((Math.random()*100)+1)
    sum = 0
    for opt in options
        sum = sum + opt.share
        if rand <= sum
            _register(opt, registerKey) if registerKey?
            return opt.value


#### Helpers ####
_register = (opt, key) ->
    return if !ab.register?
    regObj = {}
    regObj[key] = ( opt.register ? opt.value )
    ab.register(regObj)

_getProp = (property) ->
    return false if !ab.getProp
    ab.getProp(property)


#### Export Module ####

if ( typeof define == "function" && define.amd )
    define "ab", [], -> ab

if module?.exports?
    module.exports = ab
