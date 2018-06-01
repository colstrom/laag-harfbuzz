
# -*- ruby -*-

require 'mkmf' # Ruby Standard Library

require 'laag' # MIT License
require_relative '../../../lib/laag/harfbuzz'

LAAG::BuildEnvironment
  .new(LAAG.harfbuzz)
  .script { default! }

create_makefile 'laag/harfbuzz'
