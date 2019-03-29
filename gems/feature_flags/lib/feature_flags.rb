require "feature_flags/version"
require "flipper"

module FeatureFlag
  class << self
    def clear
      features.each { |f| Flipper.adapter.remove(f) }
    end

    def disable(key)
      Flipper.disable(full_key(key))
    end

    def enable(key)
      Flipper.enable(full_key(key))
    end

    def enabled?(key)
      Flipper.enabled?(full_key(key))
    rescue StandardError => e
      false
    end

    def features
      Flipper.features
    end

    def enabled_feature_keys
      features.select(&:enabled?).map { |f| f.name.gsub(prefix.to_s, '') }
    end

    def prefix
      ENV["FEATURE_FLAGS_PREFIX"]
    end

    private

    def full_key(key)
      raise ArgumentError, "Feature flag key can not be blank" if key.blank?
      [prefix, key].join
    end
  end
end
