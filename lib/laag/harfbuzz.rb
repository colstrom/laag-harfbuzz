
# -*- ruby -*-

require 'laag/library' # MIT License

module LAAG
  HARFBUZZ_GEM_ROOT = File.expand_path(File.join(__dir__, %w[.. ..]))
  HARFBUZZ_ORIGIN  = 'github.com/harfbuzz/harfbuzz'
  HARFBUZZ_VERSION = (
    $LOADED_FEATURES
      .map { |f| f.match %r{/laag-harfbuzz-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)} }
      .compact
      .map { |gem| gem['version'] }
      .uniq
      .first
  ) || (
    File
      .basename(HARFBUZZ_GEM_ROOT)
      .match(%r{^laag-harfbuzz-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)})['version']
  )

  def self.harfbuzz
    @@harfbuzz ||= Library.new(
      gem_root: HARFBUZZ_GEM_ROOT,
      origin:   HARFBUZZ_ORIGIN,
      version:  HARFBUZZ_VERSION
    )
  end
end
