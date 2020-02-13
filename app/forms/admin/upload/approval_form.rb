class Admin::Upload::ApprovalForm
  include ActiveModel::Model

  delegate :persisted, :new_record?, :to_param, to: :object
  attr_reader :object, :params

  def initialize(object, params = {})
    @object = object
    @params = params
  end

  def save
    return unless valid?

    object.save
  end

  def model_name
    ActiveModel::Name.new(self, nil, 'Admin::Upload::Approval')
  end
end
