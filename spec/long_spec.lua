--[[
 Copyright 2013 Daniel Wirtz <dcode@dcode.io>

 Licensed under the Apache License, Version 2.0 (the "License")
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS-IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
--]]

local Long = require 'long'

it('basic', function()
--  local longVal = Long:new(0xFFFFFFFF, 0x7FFFFFFF)
  Long:new(0xFFFFFFFF, 0x7FFFFFFF)
--    assert.equal(longVal:toNumber(), 9223372036854775807)
--    assert.equal(longVal:toString(), "9223372036854775807")
--    local longVal2 = Long.fromValue(longVal)
--    assert.equal(longVal2:toNumber(), 9223372036854775807)
--    assert.equal(longVal2:toString(), "9223372036854775807")
--    assert.equal(longVal2.unsigned, longVal.unsigned)
end)

it('isLong', function()
  local longVal = Long:new(0xFFFFFFFF, 0x7FFFFFFF)
  assert.equal(Long.isLong(longVal), true)
end)

it('toBytes', function()
  local longVal = Long.fromBits(0x01234567, 0x12345678)
  assert.same(longVal:toBytesBE(), {
      0x12, 0x34, 0x56, 0x78,
      0x01, 0x23, 0x45, 0x67
  })
  assert.same(longVal:toBytesLE(), {
      0x67, 0x45, 0x23, 0x01,
      0x78, 0x56, 0x34, 0x12
  })
end)

describe('unsigned', function()

--  it('min/max', function()
--    assert.equal("-9223372036854775808", Long.MIN_VALUE.toString())
--    assert.equal("9223372036854775807", Long.MAX_VALUE.toString())
--    assert.equal("18446744073709551615", Long.MAX_UNSIGNED_VALUE.toString())
--  end)

  it('construct_negint', function()
    local longVal = Long.fromInt(-1, true)
    assert.equal(-1, longVal.low)
    assert.equal(-1, longVal.high)
    assert.equal(true, longVal.unsigned)
    --assert.equal(18446744073709551615, longVal.toNumber())
    --assert.equal("18446744073709551615", longVal.toString())
  end)

  it('construct_highlow', function()
    local longVal = Long:new(0xFFFFFFFF, 0xFFFFFFFF, true)
    assert.equal(-1, longVal.low)
    assert.equal(-1, longVal.high)
    assert.equal(true, longVal.unsigned)
    --assert.equal(18446744073709551615, longVal:toNumber())
    --assert.equal("18446744073709551615", longVal.toString())
  end)

end)
