
actions :clean

VALID_TIME_KEYS = [:minutes, :hours, :days, :weeks]

attribute :name, kind_of: String
attribute :dry_run, kind_of: [TrueClass, FalseClass], default: false
attribute :files, kind_of: [TrueClass, FalseClass], default: true
attribute :directories, kind_of: [TrueClass, FalseClass], default: true
attribute :keep_last, kind_of: Integer
attribute :older_than, kind_of: Hash, callbacks: {
  "keys must be one of #{VALID_TIME_KEYS.inspect}" => lambda do |time|
    keys = time.keys.map(&:to_sym)
    keys.select { |k| VALID_TIME_KEYS.include?(k) }.empty?
  end,
  'value must be an integer' => lambda { |time| time[time.keys.first].is_a? Integer }
}

def initialize(*args)
  super
  @action = :clean
end
