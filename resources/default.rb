actions :clean

VALID_TIME_KEYS = %i[minutes hours days weeks].freeze
VALID_SORT_KEYS = %i[mtime atime ctime].freeze

attribute :name, kind_of: String
attribute :sort_by, kind_of: Symbol, default: :mtime, callbacks: {
  "value must be one of #{VALID_SORT_KEYS.inspect}" => lambda do |v|
    VALID_SORT_KEYS.include?(v)
  end
}
attribute :except, kind_of: String
attribute :dry_run, kind_of: [TrueClass, FalseClass], default: false
attribute :files, kind_of: [TrueClass, FalseClass], default: true
attribute :directories, kind_of: [TrueClass, FalseClass], default: true
attribute :keep_last, kind_of: Integer
attribute :older_than, kind_of: Hash, callbacks: {
  "keys must be one of #{VALID_TIME_KEYS.inspect}" => lambda do |time|
    keys = time.keys.map(&:to_sym)
    keys.map { |k| VALID_TIME_KEYS.include?(k) }.all?
  end,
  'value must be an integer' => ->(time) { time[time.keys.first].is_a? Integer }
}

def initialize(*args)
  super
  @action = :clean
end
