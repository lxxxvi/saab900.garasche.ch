class Upload::Statistics
  def self.call
    Upload.all.map(&:published?).tally.with_defaults({ true => 0, false => 0 })
  end
end
