require 'spec_helper'
require 'roda'

class RodaTest < Roda
  plugin :json
  route do |r|
    r.get('artists') { Rack::Reducer.call(r.params, SEQUEL_QUERY).to_a }
  end
end

describe RodaTest do
  it_behaves_like Rack::Reducer
end
