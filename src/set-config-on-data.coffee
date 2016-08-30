_ = require 'lodash'
ReturnValue = require 'nanocyte-component-return-value'

class SetConfigOnData extends ReturnValue
  onEnvelope: (envelope) =>
    {config} = envelope

    return config

module.exports = SetConfigOnData
