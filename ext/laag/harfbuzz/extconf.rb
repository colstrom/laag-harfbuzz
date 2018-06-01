
# -*- ruby -*-

require 'mkmf' # Ruby Standard Library

require 'laag' # MIT License
require_relative '../../../lib/laag/harfbuzz'

LAAG::BuildEnvironment
  .new(LAAG.harfbuzz, disable: %w[autoreconf pre-clean])
  .script do
  execute! './autogen.sh'
  default!
end

create_makefile 'laag/harfbuzz'
